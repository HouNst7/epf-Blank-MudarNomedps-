from .midia import Midia #Herdando de Midia

class Musica(Midia):
    def __init__(self, id, titulo, artista, album, duracao, genero=None, icone=None):
        super().__init__(id, titulo, duracao)
        self.artista = artista
        self.album = album
        self.genero = genero
        self.icone = icone

    def to_dict(self):
        d = super().to_dict()
        d.update({
            'artista': self.artista,
            'album': self.album,
            'genero': self.genero,
            'icone': self.icone
        })
        return d

    @staticmethod
    def from_dict(data):
        return Musica(
            id=data['id'],
            titulo=data['titulo'],
            artista=data['artista'],
            album=data['album'],
            duracao=data['duracao'],
            genero=data.get('genero'),
            icone=data.get('icone')
        )
