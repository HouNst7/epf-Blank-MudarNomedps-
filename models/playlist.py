import json
import os

DATA_DIR = os.path.join(os.path.dirname(__file__), '..', 'data')

class Playlist:
    def __init__(self, id, name, user_id, song_ids):
        self.id = id
        self.name = name
        self.user_id = user_id
        self.song_ids = song_ids  # Lista de IDs de músicas

    def to_dict(self):
        return {
            'id': self.id,
            'name': self.name,
            'user_id': self.user_id,
            'song_ids': self.song_ids
        }

    @classmethod
    def from_dict(cls, data):
        return cls(
            id=data['id'],
            name=data['name'],
            user_id=data['user_id'],
            song_ids=data.get('song_ids', [])
        )


class PlaylistModel:
    FILE_PATH = os.path.join(DATA_DIR, 'playlists.json')

    def __init__(self):
        self.playlists = self._load()

    def _load(self):
        if not os.path.exists(self.FILE_PATH):
            return []
        with open(self.FILE_PATH, 'r', encoding='utf-8') as f:
            return [Playlist.from_dict(item) for item in json.load(f)]

    def _save(self):
        with open(self.FILE_PATH, 'w', encoding='utf-8') as f:
            json.dump([p.to_dict() for p in self.playlists], f, indent=4, ensure_ascii=False)

    def get_all(self):
        return self.playlists

    def get_by_id(self, playlist_id):
        return next((p for p in self.playlists if p.id == playlist_id), None)

    def add(self, playlist):
        self.playlists.append(playlist)
        self._save()

    def update(self, updated_playlist):
        for i, p in enumerate(self.playlists):
            if p.id == updated_playlist.id:
                self.playlists[i] = updated_playlist
                self._save()
                break

    def delete(self, playlist_id):
        self.playlists = [p for p in self.playlists if p.id != playlist_id]
        self._save()
