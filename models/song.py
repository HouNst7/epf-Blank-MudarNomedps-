import json
import os

DATA_DIR = os.path.join(os.path.dirname(__file__), '..', 'data')

class Song:
    def __init__(self, id, title, duration, album_id):
        self.id = id
        self.title = title
        self.duration = duration
        self.album_id = album_id

    def to_dict(self):
        return {
            'id': self.id,
            'title': self.title,
            'duration': self.duration,
            'album_id': self.album_id
        }

    @classmethod
    def from_dict(cls, data):
        return cls(**data)


class SongModel:
    FILE_PATH = os.path.join(DATA_DIR, 'songs.json')

    def __init__(self):
        self.songs = self._load()

    def _load(self):
        if not os.path.exists(self.FILE_PATH):
            return []
        with open(self.FILE_PATH, 'r', encoding='utf-8') as f:
            return [Song.from_dict(item) for item in json.load(f)]

    def _save(self):
        with open(self.FILE_PATH, 'w', encoding='utf-8') as f:
            json.dump([s.to_dict() for s in self.songs], f, indent=4, ensure_ascii=False)

    def get_all(self):
        return self.songs

    def get_by_id(self, song_id):
        return next((s for s in self.songs if s.id == song_id), None)

    def add(self, song):
        self.songs.append(song)
        self._save()

    def update(self, updated_song):
        for i, s in enumerate(self.songs):
            if s.id == updated_song.id:
                self.songs[i] = updated_song
                self._save()
                break

    def delete(self, song_id):
        self.songs = [s for s in self.songs if s.id != song_id]
        self._save()
