from bottle import Bottle, request
from .base_controller import BaseController
from services.artist_service import ArtistService

class ArtistController(BaseController):
    def __init__(self, app):
        super().__init__(app)
        self.artist_service = ArtistService()
        self.setup_routes()

    def setup_routes(self):
        self.app.route('/artists', method='GET', callback=self.list_artists)
        self.app.route('/artists/add', method=['GET', 'POST'], callback=self.add_artist)
        self.app.route('/artists/edit/<artist_id:int>', method=['GET', 'POST'], callback=self.edit_artist)
        self.app.route('/artists/delete/<artist_id:int>', method='POST', callback=self.delete_artist)

    def list_artists(self):
        artists = self.artist_service.get_all()
        return self.render('artists', artists=artists)

    def add_artist(self):
        if request.method == 'GET':
            return self.render('artist_form', artist=None, action='/artists/add')
        else:
            self.artist_service.save()
            self.redirect('/artists')

    def edit_artist(self, artist_id):
        artist = self.artist_service.get_by_id(artist_id)
        if not artist:
            return "Artista não encontrado"
        if request.method == 'GET':
            return self.render('artist_form', artist=artist, action=f'/artists/edit/{artist_id}')
        else:
            self.artist_service.edit(artist)
            self.redirect('/artists')

    def delete_artist(self, artist_id):
        self.artist_service.delete(artist_id)
        self.redirect('/artists')

artist_routes = Bottle()
artist_controller = ArtistController(artist_routes)
