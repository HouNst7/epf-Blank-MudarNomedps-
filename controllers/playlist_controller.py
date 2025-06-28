from bottle import Bottle, request
from .base_controller import BaseController
from services.playlist_service import PlaylistService
from services.user_service import UserService
from services.song_service import SongService

class PlaylistController(BaseController):
    def __init__(self, app):
        super().__init__(app)
        self.playlist_service = PlaylistService()
        self.user_service = UserService()
        self.song_service = SongService()
        self.setup_routes()

    def setup_routes(self):
        self.app.route('/playlists', method='GET', callback=self.list_playlists)
        self.app.route('/playlists/add', method=['GET', 'POST'], callback=self.add_playlist)
        self.app.route('/playlists/edit/<playlist_id:int>', method=['GET', 'POST'], callback=self.edit_playlist)
        self.app.route('/playlists/delete/<playlist_id:int>', method='POST', callback=self.delete_playlist)

    def list_playlists(self):
        playlists = self.playlist_service.get_all()
        users = {u.id: u.name for u in self.user_service.get_all()}
        songs = {s.id: s.title for s in self.song_service.get_all()}
        return self.render('playlists', playlists=playlists, users=users, songs=songs)

    def add_playlist(self):
        if request.method == 'GET':
            users = self.user_service.get_all()
            songs = self.song_service.get_all()
            return self.render('playlist_form', playlist=None, action='/playlists/add', users=users, songs=songs)
        else:
            self.playlist_service.save()
            self.redirect('/playlists')

    def edit_playlist(self, playlist_id):
        playlist = self.playlist_service.get_by_id(playlist_id)
        if not playlist:
            return "Playlist não encontrada"
        if request.method == 'GET':
            users = self.user_service.get_all()
            songs = self.song_service.get_all()
            return self.render('playlist_form', playlist=playlist, action=f'/playlists/edit/{playlist_id}', users=users, songs=songs)
        else:
            self.playlist_service.edit(playlist)
            self.redirect('/playlists')

    def delete_playlist(self, playlist_id):
        self.playlist_service.delete(playlist_id)
        self.redirect('/playlists')

playlist_routes = Bottle()
playlist_controller = PlaylistController(playlist_routes)
