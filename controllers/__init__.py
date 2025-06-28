from bottle import Bottle
from controllers.user_controller import user_routes
from controllers.artist_controller import artist_routes


def init_controllers(app: Bottle):
    app.merge(user_routes)
    app.merge(artist_routes)
