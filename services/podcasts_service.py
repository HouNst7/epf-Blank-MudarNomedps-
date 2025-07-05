import os
import json
from models.podcast import Podcast

PODCASTS_FILE = os.path.join(os.path.dirname(__file__), '../data/podcasts.json')

def load_podcasts():
    if not os.path.exists(PODCASTS_FILE):
        return []
    with open(PODCASTS_FILE, 'r', encoding='utf-8') as f:
        try:
            data = json.load(f)
            return [Podcast.from_dict(p) for p in data]
        except Exception:
            return []

def save_podcasts(podcasts):
    with open(PODCASTS_FILE, 'w', encoding='utf-8') as f:
        json.dump([p.to_dict() for p in podcasts], f, ensure_ascii=False, indent=4)

def add_podcast(podcast):
    podcasts = load_podcasts()
    podcasts.append(podcast)
    save_podcasts(podcasts)

def get_podcast_by_id(podcast_id):
    podcasts = load_podcasts()
    for p in podcasts:
        if p.id == podcast_id:
            return p
    return None
