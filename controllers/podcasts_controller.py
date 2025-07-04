from bottle import route, request, redirect, template, response
from models.podcast import Podcast
from services.podcasts_service import load_podcasts, add_podcast, get_podcast_by_id
from services.usuarios_service import load_users

def get_usuario_logado():
    usuario_email = request.get_cookie('usuario_email')
    if not usuario_email:
        return None
    users = load_users()
    for user in users:
        if user['email'] == usuario_email:
            return user
    return None

@route('/podcasts')
def listar_podcasts():
    podcasts = load_podcasts()
    usuario = get_usuario_logado()
    return template('podcasts', podcasts=podcasts, usuario=usuario)

@route('/podcasts/novo', method=['GET', 'POST'])
def novo_podcast():
    usuario = get_usuario_logado()
    if not usuario or usuario.get('tipo') != 'admin':
        return template('erro', mensagem='Apenas administradores podem cadastrar podcasts.')
    erro = None
    if request.method == 'POST':
        titulo = request.forms.get('titulo')
        apresentador = request.forms.get('apresentador')
        episodios = request.forms.get('episodios')
        duracao = request.forms.get('duracao')
        if not (titulo and apresentador and episodios and duracao):
            erro = 'Preencha todos os campos.'
        else:
            podcasts = load_podcasts()
            novo_id = max([p.id for p in podcasts] or [0]) + 1
            podcast = Podcast(id=novo_id, titulo=titulo, apresentador=apresentador, episodios=int(episodios), duracao=duracao)
            add_podcast(podcast)
            return redirect('/podcasts')
    return template('novo_podcast', erro=erro)

@route('/podcasts/<podcast_id:int>')
def detalhes_podcast(podcast_id):
    podcast = get_podcast_by_id(podcast_id)
    if not podcast:
        return template('erro', mensagem='Podcast não encontrado.')
    return template('detalhes_podcast', podcast=podcast)

@route('/podcast/<podcast_id:int>/ouvir')
def ouvir_podcast(podcast_id):
    podcast = get_podcast_by_id(podcast_id)
    if not podcast:
        return template('erro', mensagem='Podcast não encontrado.')
    return template('ouvir_podcast', podcast=podcast)
