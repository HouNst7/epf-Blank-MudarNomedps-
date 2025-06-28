from bottle import request
from models.artist import ArtistModel, Artist

class ArtistService:
    def __init__(self):
        self.artist_model = ArtistModel()

    def get_all(self):
        return self.artist_model.get_all()

    def save(self):
        last_id = max([a.id for a in self.artist_model.get_all()], default=0)
        new_id = last_id + 1
        name = request.forms.get('name')
        genre = request.forms.get('genre')
        description = request.forms.get('description')

        artist = Artist(new_id, name, genre, description)
        self.artist_model.add(artist)

    def get_by_id(self, artist_id):
        return self.artist_model.get_by_id(artist_id)

    def edit(self, artist):
        artist.name = request.forms.get('name')
        artist.genre = request.forms.get('genre')
        artist.description = request.forms.get('description')

        self.artist_model.update(artist)

    def delete(self, artist_id):
        self.artist_model.delete(artist_id)
