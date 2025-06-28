class Usuario:
    def _init_(self, id, nome, email, senha, tipo ='regular'):
        self.id = id
        self.nome = nome
        self.email = email
        self.senha = senha
        self.tipo = tipo
        self.playlists = []