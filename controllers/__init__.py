from bottle import Bottle
from controllers.user_controller import user_routes
from controllers.artist_controller import artist_routes
from controllers.album_controller import album_routes
from controllers.song_controller import song_routes
from controllers.playlist_controller import playlist_routes


def init_controllers(app: Bottle):
    app.merge(user_routes)
    app.merge(artist_routes)
    app.merge(album_routes)
    app.merge(song_routes)
    app.merge(playlist_routes)