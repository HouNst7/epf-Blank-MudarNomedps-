class Musica:
    def __init__(self, id, titulo, artista, album, duracao):
        self.id = id
        self.titulo = titulo
        self.artista = artista
        self.album = album
        self.duracao = duracao  # Exemplo: '3:45'

    def to_dict(self):
        return {
            'id': self.id,
            'titulo': self.titulo,
            'artista': self.artista,
            'album': self.album,
            'duracao': self.duracao
        }

    @staticmethod
    def from_dict(data):
        return Musica(
            id=data['id'],
            titulo=data['titulo'],
            artista=data['artista'],
            album=data['album'],
            duracao=data['duracao']
        )
