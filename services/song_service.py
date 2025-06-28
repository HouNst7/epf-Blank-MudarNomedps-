from bottle import request
from models.song import SongModel, Song

class SongService:
    def __init__(self):
        self.song_model = SongModel()

    def get_all(self):
        return self.song_model.get_all()

    def save(self):
        last_id = max([s.id for s in self.song_model.get_all()], default=0)
        new_id = last_id + 1
        title = request.forms.get('title')
        duration = request.forms.get('duration')
        album_id = int(request.forms.get('album_id'))

        song = Song(new_id, title, duration, album_id)
        self.song_model.add(song)

    def get_by_id(self, song_id):
        return self.song_model.get_by_id(song_id)

    def edit(self, song):
        song.title = request.forms.get('title')
        song.duration = request.forms.get('duration')
        song.album_id = int(request.forms.get('album_id'))

        self.song_model.update(song)

    def delete(self, song_id):
        self.song_model.delete(song_id)
