from bottle import route, request, redirect, template, response, static_file
from models.usuarios import Usuario
from services.usuarios_service import load_users, save_users
import os

@route('/cadastro', method=['GET', 'POST'])
def cadastro():
    erro = None
    if request.method == 'POST':
        nome = request.forms.get('nome')
        email = request.forms.get('email')
        senha = request.forms.get('senha')
        tipo = request.forms.get('tipo') or 'regular'
        users = load_users()
        if any(u['email'] == email for u in users):
            erro = "Usuário já existe!"
            return template('cadastro', erro=erro)
        novo = Usuario(id=(max([u['id'] for u in users] or [0]) + 1), nome=nome, email=email, senha=senha, tipo=tipo)
        users.append(novo.to_dict())
        save_users(users)
        return redirect('/login')
    return template('cadastro', erro=erro)

@route('/login', method=['GET', 'POST'])
def login():
    erro = None
    if request.method == 'POST':
        email = request.forms.get('email')
        senha = request.forms.get('senha')
        users = load_users()
        usuario = None
        for u in users:
            if u['email'] == email and u['senha'] == senha:
                usuario = Usuario.from_dict(u)
                break
        if usuario:
            response.set_cookie('usuario_email', email, path='/')
            return redirect('/')
        erro = "Login inválido!"
    return template('login', erro=erro)

@route('/')
def home():
    from app import get_usuario_logado
    usuario = get_usuario_logado()
    return template('home', usuario=usuario.to_dict() if usuario else None)

@route('/perfil', method=['GET', 'POST'])
def editar_perfil():
    from app import get_usuario_logado
    usuario = get_usuario_logado()
    if not usuario:
        return redirect('/login')
    erro = None
    if request.method == 'POST':
        nome = request.forms.get('nome')
        senha = request.forms.get('senha')
        tipo = usuario.tipo  # Não permite troca de tipo para regular
        if usuario.tipo == 'admin':
            tipo = request.forms.get('tipo') or 'admin'
        icone = usuario.icone
        upload = request.files.get('icone')
        if upload and upload.filename:
            ext = os.path.splitext(upload.filename)[1].lower()
            if ext not in ['.jpg', '.jpeg', '.png']:
                erro = 'Formato de imagem não suportado.'
            else:
                icone_path = f'static/img/usuarios/{usuario.id}{ext}'
                upload.save(icone_path, overwrite=True)
                icone = f'/static/img/usuarios/{usuario.id}{ext}'
        if not erro:
            users = load_users()
            for u in users:
                if u['email'] == usuario.email:
                    u['nome'] = nome
                    u['senha'] = senha
                    u['icone'] = icone
                    if usuario.tipo == 'admin':
                        u['tipo'] = tipo
            save_users(users)
            return redirect('/perfil')
    return template('perfil', usuario=usuario.to_dict(), erro=erro)

@route('/perfil/excluir', method=['POST'])
def excluir_perfil():
    from app import get_usuario_logado
    usuario = get_usuario_logado()
    if not usuario:
        return redirect('/login')
    users = load_users()
    users = [u for u in users if u['email'] != usuario.email]
    save_users(users)
    response.delete_cookie('usuario_email')
    return redirect('/')

@route('/static/img/usuarios/<filename:path>')
def user_icon(filename):
    return static_file(filename, root='static/img/usuarios')
