import json
import os

DATA_DIR = os.path.join(os.path.dirname(__file__), '..', 'data')

class Artist:
    def __init__(self, id, name, genre, description):
        self.id = id
        self.name = name
        self.genre = genre
        self.description = description

    def to_dict(self):
        return {
            'id': self.id,
            'name': self.name,
            'genre': self.genre,
            'description': self.description
        }

    @classmethod
    def from_dict(cls, data):
        return cls(**data)


class ArtistModel:
    FILE_PATH = os.path.join(DATA_DIR, 'artists.json')

    def __init__(self):
        self.artists = self._load()

    def _load(self):
        if not os.path.exists(self.FILE_PATH):
            return []
        with open(self.FILE_PATH, 'r', encoding='utf-8') as f:
            return [Artist.from_dict(item) for item in json.load(f)]

    def _save(self):
        with open(self.FILE_PATH, 'w', encoding='utf-8') as f:
            json.dump([a.to_dict() for a in self.artists], f, indent=4, ensure_ascii=False)

    def get_all(self):
        return self.artists

    def get_by_id(self, artist_id):
        return next((a for a in self.artists if a.id == artist_id), None)

    def add(self, artist):
        self.artists.append(artist)
        self._save()

    def update(self, updated_artist):
        for i, a in enumerate(self.artists):
            if a.id == updated_artist.id:
                self.artists[i] = updated_artist
                self._save()
                break

    def delete(self, artist_id):
        self.artists = [a for a in self.artists if a.id != artist_id]
        self._save()
