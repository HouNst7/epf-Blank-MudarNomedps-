class Usuario:
    def __init__(self, id, nome, email, senha, tipo='regular'):
        self.id = id
        self.nome = nome
        self.email = email
        self.senha = senha
        self.set_tipo(tipo)

    def set_tipo(self, tipo):
        if tipo in ['regular', 'admin']:
            self._tipo = tipo
        else:
            raise ValueError("Tipo de usuário inválido. Use 'regular' ou 'admin'.")

    def get_tipo(self):
        return self._tipo

    @property
    def tipo(self):
        return self.get_tipo()

    def to_dict(self):
        return {
            'id': self.id,
            'nome': self.nome,
            'email': self.email,
            'senha': self.senha,
            'tipo': self.tipo
        }

    @staticmethod
    def from_dict(data):
        return Usuario(
            data['id'],
            data['nome'],
            data['email'],
            data['senha'],
            data.get('tipo', 'regular')
        )
