# 🎵 Gamafy - Plataforma de Músicas

<p align="center">
  <img src="/static/img/logo_gamafy.png" alt="Logo" title="Gamafy Logo" width="25%" />
</p>

## 🔍 Visão Geral

Gamafy é uma plataforma de músicas inspirada no spotify.
Este projeto foi desenvolvido por estudantes de Engenharia no terceiro semestre na Universidade de Brasília (UnB) campus FCTE. Projeto realizado como trabalho final da disciplina de "Orientação a Objetos" no curso de "Engenharias".

## 📣 Características

- Autenticação de Usuário
- Interface responsiva
- Permite a adição de Músicas, Playlists e Podcasts
- Criação e Edição de Perfil

## 🖼️ Demonstração

### Página Inicial

<p>
  <img src="/static/img/screenshots/home print.png" alt="Pagina Home" title="Pagina Home" width="100%" />
</p>

### Página de Playlists

<p>
  <img src="/static/img/screenshots/playlist print.png" alt="Pagina Playlists" title="Pagina Playlists" width="100%" />
</p>

### Página da Música

<p>
  <img src="/static/img/screenshots/pagina da musica print.png" alt="Pagina Musica" title="Pagina Musica" width="100%" />
</p>

### Página de Perfil

<p>
  <img src="/static/img/screenshots/pagina perfil print.png" alt="Pagina Perfil" title="Pagina Perfil" width="100%" />
</p>

## 📂 Estrutura do Projeto

```
└──epf-gamafy/  
    ├── README.md # Este arquivo  
    ├── app.py # Ponto de entrada do sistema  
    ├── config.py # Configurações e caminhos do projeto  
    ├── main.py # Inicialização da aplicação  
    ├── Makefile  
    ├── requirements.txt # Dependências do projeto  
    ├── .pylintrc  
    ├── controllers/ # Controladores e rotas  
    │   ├── __init__.py  
    │   ├── musicas_controller.py  
    │   ├── podcasts_controller.py  
    │   └── usuarios_controller.py  
    ├── data/ # Arquivos JSON de dados  
    │   ├── musicas.json  
    │   ├── playlists.json  
    │   ├── podcasts.json  
    │   └── users.json  
    ├── models/ # Definição das entidades (ex: usuarios)  
    │   ├── midia.py  
    │   ├── musica.py  
    │   ├── playlist.py  
    │   ├── podcast.py  
    │   └── usuarios.py  
    ├── services/ # Lógica de persistência (JSON)  
    │   ├── musicas_service.py  
    │   ├── playlists_service.py  
    │   ├── podcasts_service.py  
    │   └── usuarios_service.py  
    ├── static/ # CSS, JS e imagens  
    │   ├── css/  
    │   │   ├── helper.css  
    │   │   └── style.css  
    │   └── js/  
    │       ├── helper.js  
    │       └── main.js  
    └── views/ # Arquivos HTML (Bottle Templating)  
        ├── _comentario_remocoes.txt  
        ├── adicionar_musica.tpl  
        ├── cadastrar_musica.tpl  
        ├── cadastro.tpl  
        ├── cadastro_sucesso.tpl  
        ├── detalhes_musica.tpl  
        ├── detalhes_podcast.tpl  
        ├── erro.tpl  
        ├── home.tpl  
        ├── login.tpl  
        ├── musicas.tpl  
        ├── nova_musica.tpl  
        ├── nova_playlist.tpl  
        ├── novo_podcast.tpl  
        ├── ouvir_podcast.tpl  
        ├── perfil.tpl  
        ├── playlists.tpl  
        ├── podcasts.tpl  
        ├── register.tpl  
        ├── tocar_musica.tpl  
        ├── tocar_playlist.tpl  
        └── ver_playlist.tpl
```
---

## 📁 Descrição das Pastas

### `controllers/`
Contém as classes responsáveis por lidar com as rotas da aplicação. Exemplos:
- `usuarios_controller.py`: rotas para listagem, adição, edição e remoção de usuários.
- `musicas_controller`: rotas para cadastro e processamento de músicas

### `models/`
Define as classes que representam os dados da aplicação. Exemplo:
- `usuarios.py`: classe `Usuario`, com atributos como `id`, `nome`, `email`, `senha` etc.

### `services/`
Responsável por salvar, carregar e manipular dados usando arquivos JSON. Exemplo:
- `playlist.py`: contém métodos como `adicionar_item`, `remover_item`.

### `views/`
Contém os arquivos `.tpl` utilizados pelo Bottle como páginas HTML:
- `home.tpl`: página inicial do site.
- `detalhes_musica.tpl`: é a página de uma música, contém informações como título, autor, álbum e duração.
- `perfil.tpl`: página para edição de perfil.

### `static/`
Arquivos estáticos como:
- `css/style.css`: estilos básicos.
- `js/main.js`: scripts JS opcionais.
- `logo_gamafy.png`: logo do site.

### `data/`
Armazena os arquivos `.json` que simulam o banco de dados:
- `musicas.json`: onde os dados das músicas são persistidos.

---
## 📋 Diagrama de Classes

<p>
  <img src="/static/img/screenshots/Diagrama de Classes.jpeg" alt="Diagrama Classes" title="Diagrama Classes" width="40%" />
</p>

## 🌐 Tecnologias Utilizadas


**Frontend:**
- ![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)  
- ![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)  
- ![Python](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)  


**Backend:**
- ![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)  
- Bottles Framework


**Outras Ferramentas:**
- ![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)  
- ![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)  


## ▶️ Como Executar

1. Clone o repositório:
```bash
git clone https://github.com/HouNst7/epf-Gamafy
cd epf-Gamafy
```

2. Crie o ambiente virtual na pasta fora do seu projeto:
```bash
python -m venv venv
source venv/bin/activate  # Linux/Mac
venv\\Scripts\\activate     # Windows
```

3. Entre dentro do seu projeto criado a partir do template e instale as dependências:
```bash
pip install -r requirements.txt
```

4. Rode a aplicação:
```bash
python main.py
```

4. Acesse sua aplicação no navegador em: [http://localhost:8080](http://localhost:8080)

## 🙋‍♂️ Membros

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/HouNst7">
        <img src="https://github.com/HouNst7.png" width="100px;" alt="Elias Sobrinho"/>
        <br /><sub><b>Elias Gomes Sobrinho</b></sub>
      </a>
      <br /><span>Frontend</span>
    </td>
    <td align="center">
      <a href="https://github.com/NBukvar">
        <img src="https://github.com/NBukvar.png" width="100px;" alt="Nicolai Miketen"/>
        <br /><sub><b>Nicolai Bukvar Miketen</b></sub>
      </a>
      <br /><span>Backend</span>
    </td>
  </tr>
</table>

## 🧠 Autores e Licença
Projeto desenvolvido pelos alunos:

Elias Gomes Sobrinho; Matrícula 241011706  
Nicolai Bukvar Miketen; Matrícula 241025345
                                   
Você pode reutilizar, modificar e compartilhar livremente.

