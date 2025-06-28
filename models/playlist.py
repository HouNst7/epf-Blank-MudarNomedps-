class Playlist:
    def __init__(self, id, nome, usuario_id, musicas=None):
        self.id = id
        self.nome = nome
        self.usuario_id = usuario_id  # id do usuário dono da playlist
        self.musicas = musicas or []  # lista de ids de músicas

    def adicionar_musica(self, musica_id):
        if musica_id not in self.musicas:
            self.musicas.append(musica_id)

    def remover_musica(self, musica_id):
        if musica_id in self.musicas:
            self.musicas.remove(musica_id)

    def to_dict(self):
        return {
            'id': self.id,
            'nome': self.nome,
            'usuario_id': self.usuario_id,
            'musicas': self.musicas
        }

    @staticmethod
    def from_dict(data):
        return Playlist(
            id=data['id'],
            nome=data['nome'],
            usuario_id=data['usuario_id'],
            musicas=data.get('musicas', [])
        )
