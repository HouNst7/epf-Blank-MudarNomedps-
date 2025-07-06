import json
import os
from models.usuarios import Usuario

CAMINHO = 'data/usuarios.json' #Caminho padrão para o arquivo de usuários usado pelo método salvar_usuarios/carregar_usuarios
USERS_FILE = os.path.join(os.path.dirname(__file__), '../data/users.json') #Caminho alternativo usado pelos métodos load_users caso o padrao nao funcione

def carregar_usuarios():
    if not os.path.exists(CAMINHO):
        return []   # Retorna lista vazia se o arquivo não existir
    with open(CAMINHO, 'r') as f:
        dados = json.load(f)
        return [Usuario.from_dict(d) for d in dados]  #Reconstrói os objetos Usuario

def salvar_usuarios(lista):
    with open(CAMINHO, 'w') as f:
        json.dump([u.to_dict() for u in lista], f, indent=4)

def encontrar_por_email(email):
    # Busca no arquivo users.json (padrão do sistema)
    if not os.path.exists(USERS_FILE):
        return None
    with open(USERS_FILE, 'r', encoding='utf-8') as f:
        try:
            users = json.load(f)
            for user in users:
                if user['email'] == email:
                    from models.usuarios import Usuario
                    return Usuario.from_dict(user)
        except Exception:
            return None
    return None

def load_users():
    if not os.path.exists(USERS_FILE):
        return []
    with open(USERS_FILE, 'r', encoding='utf-8') as f:
        try:
            return json.load(f) #Retorna a lista de dicionários
        except Exception:
            return []

def save_users(users): #Salva uma lista de usuários no arquivo USERS_FILE
    with open(USERS_FILE, 'w', encoding='utf-8') as f:
        json.dump(users, f, ensure_ascii=False, indent=4)
