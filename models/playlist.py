class Playlist:
    def __init__(self, id, nome, usuario_id, itens=None, publica=True):
        self.id = id
        self.nome = nome
        self.usuario_id = usuario_id  # id do usuário dono da playlist
        self.itens = itens or []  # lista de dicts: {tipo: musica/podcast}
        self.publica = publica

    def adicionar_item(self, tipo, item_id):
        if not any(i['tipo'] == tipo and i['id'] == item_id for i in self.itens):
            self.itens.append({'tipo': tipo, 'id': item_id})

    def remover_item(self, tipo, item_id):
        self.itens = [i for i in self.itens if not (i['tipo'] == tipo and i['id'] == item_id)]

    def to_dict(self):
        return {
            'id': self.id,
            'nome': self.nome,
            'usuario_id': self.usuario_id,
            'itens': self.itens,
            'publica': self.publica
        }

    @staticmethod
    def from_dict(data):
        return Playlist(
            id=data['id'],
            nome=data['nome'],
            usuario_id=data['usuario_id'],
            itens=data.get('itens', []),
            publica=data.get('publica', True)
        )
