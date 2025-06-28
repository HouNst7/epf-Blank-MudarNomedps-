from bottle import Bottle, request
from .base_controller import BaseController
from services.song_service import SongService
from services.album_service import AlbumService

class SongController(BaseController):
    def __init__(self, app):
        super().__init__(app)
        self.song_service = SongService()
        self.album_service = AlbumService()
        self.setup_routes()

    def setup_routes(self):
        self.app.route('/songs', method='GET', callback=self.list_songs)
        self.app.route('/songs/add', method=['GET', 'POST'], callback=self.add_song)
        self.app.route('/songs/edit/<song_id:int>', method=['GET', 'POST'], callback=self.edit_song)
        self.app.route('/songs/delete/<song_id:int>', method='POST', callback=self.delete_song)

    def list_songs(self):
        songs = self.song_service.get_all()
        albums = {a.id: a.title for a in self.album_service.get_all()}
        return self.render('songs', songs=songs, albums=albums)

    def add_song(self):
        if request.method == 'GET':
            albums = self.album_service.get_all()
            return self.render('song_form', song=None, action='/songs/add', albums=albums)
        else:
            self.song_service.save()
            self.redirect('/songs')

    def edit_song(self, song_id):
        song = self.song_service.get_by_id(song_id)
        if not song:
            return "Música não encontrada"
        if request.method == 'GET':
            albums = self.album_service.get_all()
            return self.render('song_form', song=song, action=f'/songs/edit/{song_id}', albums=albums)
        else:
            self.song_service.edit(song)
            self.redirect('/songs')

    def delete_song(self, song_id):
        self.song_service.delete(song_id)
        self.redirect('/songs')

song_routes = Bottle()
song_controller = SongController(song_routes)
