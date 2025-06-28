from bottle import default_app, route, run, template, request, redirect, response, TEMPLATE_PATH
import os
import json
from services.playlists_service import get_playlists_by_user, add_playlist, get_playlist_by_id, save_playlists
from models.playlist import Playlist
from services.usuarios_service import load_users
from services.musicas_service import load_musicas, add_musica, get_musica_by_id
from models.musica import Musica

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
    playlists = get_playlists_by_user(usuario['id'])
    return template('playlists', playlists=playlists)

@route('/playlists/nova', method=['GET', 'POST'])
def criar_playlist():
    erro = None
    usuario = get_usuario_logado()
    if not usuario:
        return redirect('/login')
    if request.method == 'POST':
        nome = request.forms.get('nome')
        usuario_id = usuario['id']
        if not nome:
            erro = 'O nome da playlist é obrigatório.'
        else:
            playlists = get_playlists_by_user(usuario_id)
            novo_id = max([p.id for p in playlists] or [0]) + 1
            playlist = Playlist(id=novo_id, nome=nome, usuario_id=usuario_id)
            add_playlist(playlist)
            return redirect('/playlists')
    return template('nova_playlist', erro=erro)

@route('/musicas')
def listar_musicas():
    musicas = load_musicas()
    return template('musicas', musicas=musicas)

@route('/musicas/nova', method=['GET', 'POST'])
def nova_musica():
    erro = None
    if request.method == 'POST':
        titulo = request.forms.get('titulo')
        artista = request.forms.get('artista')
        album = request.forms.get('album')
        duracao = request.forms.get('duracao')
        if not (titulo and artista and album and duracao):
            erro = 'Preencha todos os campos.'
        else:
            musicas = load_musicas()
            novo_id = max([m.id for m in musicas] or [0]) + 1
            musica = Musica(id=novo_id, titulo=titulo, artista=artista, album=album, duracao=duracao)
            add_musica(musica)
            return redirect('/musicas')
    return template('nova_musica', erro=erro)

@route('/playlists/<playlist_id:int>/adicionar', method=['GET', 'POST'])
def adicionar_musica_playlist(playlist_id):
    erro = None
    playlist = get_playlist_by_id(playlist_id)
    musicas = load_musicas()
    if not playlist:
        return '<h2>Playlist não encontrada.</h2><a href="/playlists">Voltar</a>'
    if request.method == 'POST':
        musica_id = int(request.forms.get('musica_id'))
        if musica_id not in playlist.musicas:
            playlist.musicas.append(musica_id)
            # Atualiza e salva todas as playlists
            playlists = get_playlists_by_user(playlist.usuario_id)
            for i, p in enumerate(playlists):
                if p.id == playlist.id:
                    playlists[i] = playlist
            save_playlists(playlists)
            return redirect('/playlists')
        else:
            erro = 'Música já está na playlist.'
    return template('adicionar_musica', playlist=playlist, musicas=musicas, erro=erro)

@route('/playlists/<playlist_id:int>')
def ver_playlist(playlist_id):
    playlist = get_playlist_by_id(playlist_id)
    if not playlist:
        return '<h2>Playlist não encontrada.</h2><a href="/playlists">Voltar</a>'
    musicas = [get_musica_by_id(mid) for mid in playlist.musicas]
    return template('ver_playlist', playlist=playlist, musicas=musicas)

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

app = default_app()

def run():
    app.run(host='localhost', port=8080, debug=True, reloader=True)
