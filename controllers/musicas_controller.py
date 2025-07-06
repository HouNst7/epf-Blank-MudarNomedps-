from bottle import route, request, redirect, template, response, static_file
from models.musica import Musica
from services.musicas_service import add_musica, load_musicas
from services.usuarios_service import encontrar_por_email
import os

UPLOAD_PATH = './static/img/'

# Rota para cadastro de música (apenas para admin)
@route('/musicas/cadastrar', method=['GET', 'POST']) #Recebe a requisição:GET mostra o formulário, POST processa o cadastro
def cadastrar_musica():
    usuario_email = request.get_cookie('usuario_email')
    usuario = encontrar_por_email(usuario_email) if usuario_email else None
    if not usuario or usuario.tipo != 'admin':
        return template('erro', mensagem='Apenas administradores podem cadastrar músicas.')

    erro = None
    if request.method == 'POST': #Processa dados
        titulo = request.forms.get('titulo')
        artista = request.forms.get('artista')
        album = request.forms.get('album')
        genero = request.forms.get('genero')
        duracao = request.forms.get('duracao')
        icone = request.files.get('icone')
        if not (titulo and artista):
            erro = 'Preencha todos os campos obrigatórios.'
        else: #Salvar a musica com novo Id
            musicas = load_musicas()
            novo_id = len(musicas) + 1
            icone_path = None
            if icone and icone.filename:
                ext = os.path.splitext(icone.filename)[1].lower()
                if ext not in ['.png', '.jpg', '.jpeg']:
                    erro = 'Apenas arquivos PNG ou JPG são permitidos.'
                else:
                    icone_path = f'/static/img/capaID{novo_id}{ext}'
                    icone.save(UPLOAD_PATH + f'capaID{novo_id}{ext}', overwrite=True)
            if not erro:
                nova = Musica(id=novo_id, titulo=titulo, artista=artista, album=album or '', duracao=duracao or '', genero=genero or '', icone=icone_path)
                add_musica(nova) #usa o service add_musca para add a musica
                return redirect('/musicas')
    return template('cadastrar_musica', erro=erro) #caso nao funcione, envia o template de erro
