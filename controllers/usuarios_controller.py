from bottle import route, request, redirect, template
from models.usuarios import Usuario
from services.usuarios_service import carregar_usuarios, salvar_usuarios, encontrar_por_email

@route('/cadastro', method=['GET', 'POST'])
def cadastro():
    if request.method == 'POST':
        nome = request.forms.get('nome')
        email = request.forms.get('email')
        senha = request.forms.get('senha')

        if encontrar_por_email(email):
            return "Usuário já existe!"

        usuarios = carregar_usuarios()
        novo = Usuario(id=len(usuarios)+1, nome=nome, email=email, senha=senha)
        usuarios.append(novo)
        salvar_usuarios(usuarios)
        return redirect('/login')

    return template('cadastro')

@route('/login', method=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.forms.get('email')
        senha = request.forms.get('senha')
        usuario = encontrar_por_email(email)

        if usuario and usuario.senha == senha:
            return f"Bem-vindo, {usuario.nome}!"
        return "Login inválido!"

    return template('login')


from bottle import route, template

@route('/')
def home():
    return template('home')
