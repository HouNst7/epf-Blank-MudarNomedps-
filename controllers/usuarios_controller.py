from bottle import route, request, redirect, template, response
from models.usuarios import Usuario
from services.usuarios_service import carregar_usuarios, salvar_usuarios, encontrar_por_email

@route('/cadastro', method=['GET', 'POST'])
def cadastro():
    erro = None
    if request.method == 'POST':
        nome = request.forms.get('nome')
        email = request.forms.get('email')
        senha = request.forms.get('senha')
        tipo = request.forms.get('tipo') or 'regular'

        if encontrar_por_email(email):
            erro = "Usuário já existe!"
            return template('cadastro', erro=erro)

        usuarios = carregar_usuarios()
        novo = Usuario(id=len(usuarios)+1, nome=nome, email=email, senha=senha, tipo=tipo)
        usuarios.append(novo)
        salvar_usuarios(usuarios)
        return redirect('/login')

    return template('cadastro', erro=erro)

@route('/login', method=['GET', 'POST'])
def login():
    erro = None
    if request.method == 'POST':
        email = request.forms.get('email')
        senha = request.forms.get('senha')
        usuario = encontrar_por_email(email)

        if usuario and usuario.senha == senha:
            response.set_cookie('usuario_email', email, path='/')
            return redirect('/')
        erro = "Login inválido!"

    return template('login', erro=erro)


@route('/')
def home():
    usuario_email = request.get_cookie('usuario_email')
    usuario = encontrar_por_email(usuario_email) if usuario_email else None
    return template('home', usuario=usuario)
