from bottle import request
from models.playlist import PlaylistModel, Playlist

class PlaylistService:
    def __init__(self):
        self.playlist_model = PlaylistModel()

    def get_all(self):
        return self.playlist_model.get_all()

    def save(self):
        last_id = max([p.id for p in self.playlist_model.get_all()], default=0)
        new_id = last_id + 1
        name = request.forms.get('name')
        user_id = int(request.forms.get('user_id'))
        song_ids = request.forms.getall('song_ids')
        song_ids = list(map(int, song_ids))

        playlist = Playlist(new_id, name, user_id, song_ids)
        self.playlist_model.add(playlist)

    def get_by_id(self, playlist_id):
        return self.playlist_model.get_by_id(playlist_id)

    def edit(self, playlist):
        playlist.name = request.forms.get('name')
        playlist.user_id = int(request.forms.get('user_id'))
        song_ids = request.forms.getall('song_ids')
        playlist.song_ids = list(map(int, song_ids))

        self.playlist_model.update(playlist)

    def delete(self, playlist_id):
        self.playlist_model.delete(playlist_id)
