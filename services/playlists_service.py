import os
import json
from models.playlist import Playlist

PLAYLISTS_FILE = os.path.join(os.path.dirname(__file__), '../data/playlists.json')

# Carrega todas as playlists do arquivo JSON
def load_playlists():
    if not os.path.exists(PLAYLISTS_FILE):
        return []
    with open(PLAYLISTS_FILE, 'r', encoding='utf-8') as f:
        try:
            data = json.load(f)
            return [Playlist.from_dict(p) for p in data]
        except Exception:
            return []

# Salva todas as playlists no arquivo JSON
def save_playlists(playlists):
    with open(PLAYLISTS_FILE, 'w', encoding='utf-8') as f:
        json.dump([p.to_dict() for p in playlists], f, ensure_ascii=False, indent=4)

# Adiciona uma nova playlist
def add_playlist(playlist):
    playlists = load_playlists()
    playlists.append(playlist)
    save_playlists(playlists)

# Busca playlist por id
def get_playlist_by_id(playlist_id):
    playlists = load_playlists()
    for p in playlists:
        if p.id == playlist_id:
            return p
    return None

# Lista todas as playlists de um usuário
def get_playlists_by_user(usuario_id):
    return [p for p in load_playlists() if p.usuario_id == usuario_id]