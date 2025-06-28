import os
import json
from models.musica import Musica

MUSICAS_FILE = os.path.join(os.path.dirname(__file__), '../data/musicas.json')

def load_musicas():
    if not os.path.exists(MUSICAS_FILE):
        return []
    with open(MUSICAS_FILE, 'r', encoding='utf-8') as f:
        try:
            data = json.load(f)
            return [Musica.from_dict(m) for m in data]
        except Exception:
            return []

def save_musicas(musicas):
    with open(MUSICAS_FILE, 'w', encoding='utf-8') as f:
        json.dump([m.to_dict() for m in musicas], f, ensure_ascii=False, indent=4)

def add_musica(musica):
    musicas = load_musicas()
    musicas.append(musica)
    save_musicas(musicas)

def get_musica_by_id(musica_id):
    musicas = load_musicas()
    for m in musicas:
        if m.id == musica_id:
            return m
    return None
