from bottle import default_app, route, run, template, request, redirect, response, TEMPLATE_PATH
import os
import json
from services.playlists_service import get_playlists_by_user, add_playlist, get_playlist_by_id, save_playlists, load_playlists
from models.playlist import Playlist
from services.usuarios_service import load_users
from services.musicas_service import load_musicas, add_musica, get_musica_by_id
from models.musica import Musica
from controllers.musicas_controller import *
from controllers.podcasts_controller import *

# Explicitly set the template path
TEMPLATE_PATH.insert(0, os.path.join(os.path.dirname(__file__), 'views'))
USERS_FILE = os.path.join(os.path.dirname(__file__), 'data', 'users.json')

def load_users():
    if not os.path.exists(USERS_FILE):
        return []
    with open(USERS_FILE, 'r', encoding='utf-8') as f:
        try:
            return json.load(f)
        except Exception:
            return []

def save_users(users):
    with open(USERS_FILE, 'w', encoding='utf-8') as f:
        json.dump(users, f, ensure_ascii=False, indent=4)

def get_usuario_logado():
    usuario_email = request.get_cookie('usuario_email')
    if not usuario_email:
        return None
    users = load_users()
    for user in users:
        if user['email'] == usuario_email:
            return user
    return None

@route('/')
def home():
    usuario = get_usuario_logado()
    return template('home', usuario=usuario)

@route('/login', method=['GET', 'POST'])
def login():
    erro = None
    if request.method == 'POST':
        email = request.forms.get('email')
        senha = request.forms.get('senha')
        users = load_users()
        for user in users:
            if user['email'] == email and user['senha'] == senha:
                response.set_cookie('usuario_email', email, path='/')
                return redirect('/')
        erro = 'Usuário ou senha inválidos!'
    return template('login', erro=erro)

@route('/logout')
def logout():
    response.delete_cookie('usuario_email', path='/')
    return redirect('/')

@route('/cadastro', method=['GET', 'POST'])
def cadastro():
    erro = None
    if request.method == 'POST':
        email = request.forms.get('email')
        senha = request.forms.get('senha')
        nome = request.forms.get('nome')
        users = load_users()
        if any(user['email'] == email for user in users):
            erro = 'E-mail já cadastrado!'
        else:
            novo_id = max([u.get('id', 0) for u in users] or [0]) + 1
            users.append({'id': novo_id, 'nome': nome, 'email': email, 'senha': senha, 'tipo': 'regular'})
            save_users(users)
            return '<h2>Cadastro realizado com sucesso!</h2><a href="/login">Ir para login</a>'
    return template('cadastro', erro=erro)

@route('/playlists')
def listar_playlists():
    usuario = get_usuario_logado()
    if not usuario:
        return redirect('/login')
    # Exibe playlists do usuário + todas as públicas
    todas = load_playlists()
    users = load_users()
    users_dict = {u['id']: u['nome'] for u in users}
    # Adiciona o nome do criador em cada playlist
    for p in todas:
        p.usuario_nome = users_dict.get(p.usuario_id, 'desconhecido')
    playlists = [p for p in todas if p.publica or p.usuario_id == usuario['id']]
    return template('playlists', playlists=playlists, usuario=usuario)

@route('/playlists/nova', method=['GET', 'POST'])
def criar_playlist():
    erro = None
    usuario = get_usuario_logado()
    if not usuario:
        return redirect('/login')
    if request.method == 'POST':
        nome = request.forms.get('nome')
        publica = request.forms.get('publica') == 'on'
        usuario_id = usuario['id']
        if not nome:
            erro = 'O nome da playlist é obrigatório.'
        else:
            todas = load_playlists()
            novo_id = max([p.id for p in todas] or [0]) + 1
            playlist = Playlist(id=novo_id, nome=nome, usuario_id=usuario_id, publica=publica)
            add_playlist(playlist)
            return redirect('/playlists')
    return template('nova_playlist', erro=erro, usuario=usuario)

@route('/musicas', method=['GET'])
def listar_musicas():
    from services.musicas_service import load_musicas
    usuario = get_usuario_logado()
    q = request.query.q or ''
    musicas = load_musicas()
    if q:
        q_lower = q.lower()
        musicas = [m for m in musicas if q_lower in m.titulo.lower() or q_lower in m.artista.lower() or q_lower in m.album.lower()]
    return template('musicas', musicas=musicas, usuario=usuario, q=q)

@route('/musicas/<musica_id:int>')
def detalhes_musica(musica_id):
    from services.musicas_service import get_musica_by_id
    usuario = get_usuario_logado()
    musica = get_musica_by_id(musica_id)
    if not musica:
        return template('erro', mensagem='Música não encontrada.')
    return template('detalhes_musica', musica=musica, usuario=usuario)

@route('/musicas/<musica_id:int>/tocar', method=['POST'])
def tocar_musica(musica_id):
    from services.musicas_service import get_musica_by_id
    usuario = get_usuario_logado()
    musica = get_musica_by_id(musica_id)
    if not musica:
        return template('erro', mensagem='Música não encontrada.')
    return template('tocar_musica', musica=musica, usuario=usuario)

@route('/playlists/<playlist_id:int>/adicionar', method=['GET', 'POST'])
def adicionar_item_playlist(playlist_id):
    from services.podcasts_service import load_podcasts, get_podcast_by_id
    erro = None
    playlist = get_playlist_by_id(playlist_id)
    musicas = load_musicas()
    podcasts = load_podcasts()
    if not playlist:
        return '<h2>Playlist não encontrada.</h2><a href="/playlists">Voltar</a>'
    if request.method == 'POST':
        tipo = request.forms.get('tipo')
        if tipo == 'musica':
            musica_id = int(request.forms.get('musica_id'))
            if not any(i['tipo'] == 'musica' and i['id'] == musica_id for i in playlist.itens):
                playlist.itens.append({'tipo': 'musica', 'id': musica_id})
            else:
                erro = 'Música já está na playlist.'
        elif tipo == 'podcast':
            podcast_id = int(request.forms.get('podcast_id'))
            if not any(i['tipo'] == 'podcast' and i['id'] == podcast_id for i in playlist.itens):
                playlist.itens.append({'tipo': 'podcast', 'id': podcast_id})
            else:
                erro = 'Podcast já está na playlist.'
        save_playlists(load_playlists())
        if not erro:
            return redirect(f'/playlists/{playlist_id}')
    return template('adicionar_musica', playlist=playlist, musicas=musicas, podcasts=podcasts, erro=erro)

@route('/playlists/<playlist_id:int>')
def ver_playlist(playlist_id):
    from services.podcasts_service import get_podcast_by_id
    playlist = get_playlist_by_id(playlist_id)
    if not playlist:
        return '<h2>Playlist não encontrada.</h2><a href="/playlists">Voltar</a>'
    musicas = load_musicas()
    podcasts = load_podcasts()
    itens = []
    for item in playlist.itens:
        if item['tipo'] == 'musica':
            m = next((m for m in musicas if m.id == item['id']), None)
            if m:
                itens.append({'tipo': 'musica', 'obj': m})
        elif item['tipo'] == 'podcast':
            p = next((p for p in podcasts if p.id == item['id']), None)
            if p:
                itens.append({'tipo': 'podcast', 'obj': p})
    return template('ver_playlist', playlist=playlist, itens=itens)

@route('/playlists/<playlist_id:int>/remover/<musica_id:int>')
def remover_musica_playlist(playlist_id, musica_id):
    playlist = get_playlist_by_id(playlist_id)
    if not playlist:
        return '<h2>Playlist não encontrada.</h2><a href="/playlists">Voltar</a>'
    if musica_id in playlist.musicas:
        playlist.musicas.remove(musica_id)
        # Atualiza e salva todas as playlists do usuário
        playlists = get_playlists_by_user(playlist.usuario_id)
        for i, p in enumerate(playlists):
            if p.id == playlist.id:
                playlists[i] = playlist
        save_playlists(playlists)
    return redirect(f'/playlists/{playlist_id}')

@route('/playlists/<playlist_id:int>/tocar', method=['POST'])
def tocar_playlist(playlist_id):
    from services.podcasts_service import load_podcasts
    playlist = get_playlist_by_id(playlist_id)
    if not playlist:
        return template('erro', mensagem='Playlist não encontrada.')
    musicas = load_musicas()
    podcasts = load_podcasts()
    itens = []
    for item in playlist.itens:
        if item['tipo'] == 'musica':
            m = next((m for m in musicas if m.id == item['id']), None)
            if m:
                itens.append({'tipo': 'musica', 'obj': m})
        elif item['tipo'] == 'podcast':
            p = next((p for p in podcasts if p.id == item['id']), None)
            if p:
                itens.append({'tipo': 'podcast', 'obj': p})
    usuario = get_usuario_logado()
    return template('tocar_playlist', playlist=playlist, itens=itens, usuario=usuario)

app = default_app()

def run():
    app.run(host='localhost', port=8080, debug=True, reloader=True)
