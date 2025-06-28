from bottle import Bottle, request
from .base_controller import BaseController
from services.album_service import AlbumService
from services.artist_service import ArtistService  # Para listar artistas no formulário

class AlbumController(BaseController):
    def __init__(self, app):
        super().__init__(app)
        self.album_service = AlbumService()
        self.artist_service = ArtistService()
        self.setup_routes()

    def setup_routes(self):
        self.app.route('/albums', method='GET', callback=self.list_albums)
        self.app.route('/albums/add', method=['GET', 'POST'], callback=self.add_album)
        self.app.route('/albums/edit/<album_id:int>', method=['GET', 'POST'], callback=self.edit_album)
        self.app.route('/albums/delete/<album_id:int>', method='POST', callback=self.delete_album)

    def list_albums(self):
        albums = self.album_service.get_all()
        artists = {a.id: a.name for a in self.artist_service.get_all()}
        return self.render('albums', albums=albums, artists=artists)

    def add_album(self):
        if request.method == 'GET':
            artists = self.artist_service.get_all()
            return self.render('album_form', album=None, action='/albums/add', artists=artists)
        else:
            self.album_service.save()
            self.redirect('/albums')

    def edit_album(self, album_id):
        album = self.album_service.get_by_id(album_id)
        if not album:
            return "Álbum não encontrado"
        if request.method == 'GET':
            artists = self.artist_service.get_all()
            return self.render('album_form', album=album, action=f'/albums/edit/{album_id}', artists=artists)
        else:
            self.album_service.edit(album)
            self.redirect('/albums')

    def delete_album(self, album_id):
        self.album_service.delete(album_id)
        self.redirect('/albums')

album_routes = Bottle()
album_controller = AlbumController(album_routes)
