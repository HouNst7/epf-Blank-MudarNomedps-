from bottle import route, request, redirect, template, response
from models.musica import Musica
from services.musicas_service import add_musica, load_musicas
from services.usuarios_service import encontrar_por_email

# Rota para cadastro de música (apenas para admin)
@route('/musicas/cadastrar', method=['GET', 'POST'])
def cadastrar_musica():
    usuario_email = request.get_cookie('usuario')
    usuario = encontrar_por_email(usuario_email) if usuario_email else None
    if not usuario or usuario.tipo != 'admin':
        return template('erro', mensagem='Apenas administradores podem cadastrar músicas.')

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
            nova = Musica(id=len(musicas)+1, titulo=titulo, artista=artista, album=album, duracao=duracao)
            add_musica(nova)
            return redirect('/musicas')
    return template('cadastrar_musica', erro=erro)
