class Midia:
    def __init__(self, id, titulo, duracao):
        self.id = id
        self.titulo = titulo
        self.duracao = duracao

    def to_dict(self):
        return {
            'id': self.id,
            'titulo': self.titulo,
            'duracao': self.duracao
        }

    @staticmethod
    def from_dict(data):
        return Midia(
            id=data['id'],
            titulo=data['titulo'],
            duracao=data['duracao']
        )
