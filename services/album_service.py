from bottle import request
from models.album import AlbumModel, Album

class AlbumService:
    def __init__(self):
        self.album_model = AlbumModel()

    def get_all(self):
        return self.album_model.get_all()

    def save(self):
        last_id = max([a.id for a in self.album_model.get_all()], default=0)
        new_id = last_id + 1
        title = request.forms.get('title')
        year = int(request.forms.get('year'))
        artist_id = int(request.forms.get('artist_id'))

        album = Album(new_id, title, year, artist_id)
        self.album_model.add(album)

    def get_by_id(self, album_id):
        return self.album_model.get_by_id(album_id)

    def edit(self, album):
        album.title = request.forms.get('title')
        album.year = int(request.forms.get('year'))
        album.artist_id = int(request.forms.get('artist_id'))
        self.album_model.update(album)

    def delete(self, album_id):
        self.album_model.delete(album_id)
