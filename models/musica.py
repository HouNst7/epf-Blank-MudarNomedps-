from .midia import Midia

class Musica(Midia):
    def __init__(self, id, titulo, artista, album, duracao):
        super().__init__(id, titulo, duracao)
        self.artista = artista
        self.album = album

    def to_dict(self):
        d = super().to_dict()
        d.update({
            'artista': self.artista,
            'album': self.album
        })
        return d

    @staticmethod
    def from_dict(data):
        return Musica(
            id=data['id'],
            titulo=data['titulo'],
            artista=data['artista'],
            album=data['album'],
            duracao=data['duracao']
        )
