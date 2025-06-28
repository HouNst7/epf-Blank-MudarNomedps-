import json
import os

DATA_DIR = os.path.join(os.path.dirname(__file__), '..', 'data')

class Album:
    def __init__(self, id, title, year, artist_id):
        self.id = id
        self.title = title
        self.year = year
        self.artist_id = artist_id

    def to_dict(self):
        return {
            'id': self.id,
            'title': self.title,
            'year': self.year,
            'artist_id': self.artist_id
        }

    @classmethod
    def from_dict(cls, data):
        return cls(**data)


class AlbumModel:
    FILE_PATH = os.path.join(DATA_DIR, 'albums.json')

    def __init__(self):
        self.albums = self._load()

    def _load(self):
        if not os.path.exists(self.FILE_PATH):
            return []
        with open(self.FILE_PATH, 'r', encoding='utf-8') as f:
            return [Album.from_dict(item) for item in json.load(f)]

    def _save(self):
        with open(self.FILE_PATH, 'w', encoding='utf-8') as f:
            json.dump([a.to_dict() for a in self.albums], f, indent=4, ensure_ascii=False)

    def get_all(self):
        return self.albums

    def get_by_id(self, album_id):
        return next((a for a in self.albums if a.id == album_id), None)

    def add(self, album):
        self.albums.append(album)
        self._save()

    def update(self, updated_album):
        for i, a in enumerate(self.albums):
            if a.id == updated_album.id:
                self.albums[i] = updated_album
                self._save()
                break

    def delete(self, album_id):
        self.albums = [a for a in self.albums if a.id != album_id]
        self._save()
