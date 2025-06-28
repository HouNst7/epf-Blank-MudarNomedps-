from bottle import static_file, response
import json

from services.song_service import SongService
from services.artist_service import ArtistService
from bottle import request
from models.user import UserModel, User

class BaseController:
    def __init__(self, app):
        self.app = app
        self._setup_base_routes()


    def _setup_base_routes(self):
        """Configura rotas básicas comuns a todos os controllers"""
        self.app.route('/', method='GET', callback=self.home)
        self.app.route('/helper', method=['GET'], callback=self.helper)
        self.app.route('/login', method=['GET', 'POST'], callback=self.login)
        self.app.route('/register', method=['GET', 'POST'], callback=self.register)
        self.app.route('/logout', method='GET', callback=self.logout)

        # Rota para arquivos estáticos (CSS, JS, imagens)
        self.app.route('/static/<filename:path>', callback=self.serve_static)


    def get_logged_user(self):
        user_cookie = request.get_cookie('user')
        if user_cookie:
            try:
                user_data = json.loads(user_cookie)
                return user_data
            except Exception:
                return None
        return None


    def home(self):
        # Buscar músicas e artistas populares (exemplo: 5 primeiros)
        song_service = SongService()
        artist_service = ArtistService()
        popular_songs = [s.to_dict() for s in song_service.get_all()[:5]]
        popular_artists = [a.to_dict() for a in artist_service.get_all()[:5]]
        # Usuário logado (ainda None, até login)
        user = self.get_logged_user()
        return self.render('home', popular_songs=popular_songs, popular_artists=popular_artists, user=user, title='Página Inicial')


    def helper(self):
        return self.render('helper-final')


    def serve_static(self, filename):
        """Serve arquivos estáticos da pasta static/"""
        return static_file(filename, root='./static')


    def render(self, template, **context):
        """Método auxiliar para renderizar templates"""
        from bottle import template as render_template
        return render_template(template, **context)


    def redirect(self, path):
        """Método auxiliar para redirecionamento"""
        from bottle import redirect as bottle_redirect
        return bottle_redirect(path)


    def login(self):
        if request.method == 'GET':
            return self.render('login', error=None, title='Login')
        else:
            email = request.forms.get('email')
            password = request.forms.get('password')
            user_model = UserModel()
            user = next((u for u in user_model.get_all() if u.email == email), None)
            if user and getattr(user, 'password', None) == password:
                response.set_cookie('user', json.dumps(user.to_dict()), path='/')
                return self.redirect('/')
            else:
                return self.render('login', error='Email ou senha inválidos.', title='Login')


    def register(self):
        if request.method == 'GET':
            return self.render('register', error=None, title='Cadastro')
        else:
            name = request.forms.get('name')
            email = request.forms.get('email')
            password = request.forms.get('password')
            birthdate = request.forms.get('birthdate')
            user_model = UserModel()
            if any(u.email == email for u in user_model.get_all()):
                return self.render('register', error='Email já cadastrado.', title='Cadastro')
            new_id = max([u.id for u in user_model.get_all()], default=0) + 1
            user = User(new_id, name, email, birthdate)
            setattr(user, 'password', password)
            user_model.add_user(user)
            response.set_cookie('user', json.dumps(user.to_dict()), path='/')
            return self.redirect('/')


    def logout(self):
        response.delete_cookie('user', path='/')
        return self.redirect('/')
