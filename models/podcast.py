from .midia import Midia

class Podcast(Midia):
    def __init__(self, id, titulo, apresentador, episodios, duracao):
        super().__init__(id, titulo, duracao)
        self.apresentador = apresentador
        self.episodios = episodios  # número de episódios

    def to_dict(self):
        d = super().to_dict()
        d.update({
            'apresentador': self.apresentador,
            'episodios': self.episodios
        })
        return d

    @staticmethod
    def from_dict(data):
        return Podcast(
            id=data['id'],
            titulo=data['titulo'],
            apresentador=data['apresentador'],
            episodios=data['episodios'],
            duracao=data['duracao']
        )
