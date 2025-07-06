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

## 🖼️ Demonstração

### Página Inicial

<p>
  <img src="/static/img/screenshots/home print.png" alt="Pagina Home" title="Pagina Home" width="90%" />
</p>

### Página de Playlists

<p>
  <img src="/static/img/screenshots/playlist print.png" alt="Pagina Playlists" title="Pagina Playlists" width="90%" />
</p>

### Página da Música

<p>
  <img src="/static/img/screenshots/pagina da musica print.png" alt="Pagina Musica" title="Pagina Musica" width="90%" />
</p>

### Página de Perfil

<p>
  <img src="/static/img/screenshots/pagina perfil print.png" alt="Pagina Perfil" title="Pagina Perfil" width="90%" />
</p>

## 📂 Estrutura do Projeto

└── epf-gamafy/  
    ├── README.md              # Características do Projeto e Instruções  
    ├── app.py  
    ├── config.py  
    ├── main.py  
    ├── Makefile  
    ├── requirements.txt  
    ├── .pylintrc  
    ├── controllers/  
    │   ├── __init__.py  
    │   ├── base_controller.py  
    │   ├── musicas_controller.py  
    │   ├── podcasts_controller.py  
    │   └── usuarios_controller.py  
    ├── data/  
    │   ├── musicas.json  
    │   ├── playlists.json  
    │   ├── podcasts.json  
    │   └── users.json  
    ├── models/  
    │   ├── midia.py  
    │   ├── musica.py  
    │   ├── playlist.py  
    │   ├── podcast.py  
    │   ├── user.py  
    │   └── usuarios.py  
    ├── services/  
    │   ├── musicas_service.py  
    │   ├── playlists_service.py  
    │   ├── podcasts_service.py  
    │   └── usuarios_service.py  
    ├── static/  
    │   ├── css/  
    │   │   ├── helper.css  
    │   │   └── style.css  
    │   └── js/  
    │       ├── helper.js  
    │       └── main.js  
    │   ├── img/  
    │   │   ├── screenshots/  
    │   │   └── usuarios/  
    └── views/
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

1. Crie o ambiente virtual na pasta fora do seu projeto:
```bash
python -m venv venv
source venv/bin/activate  # Linux/Mac
venv\\Scripts\\activate     # Windows
```

2. Entre dentro do seu projeto criado a partir do template e instale as dependências:
```bash
pip install -r requirements.txt
```

3. Rode a aplicação:
```bash
python main.py
```

4. Accese sua aplicação no navegador em: [http://localhost:8080](http://localhost:8080)

## 🙋‍♂️ Membros

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/HouNst7">
        <img src="https://github.com/HouNst7.png" width="100px;" alt="Elias Sobrinho"/>
        <br /><sub><b>Elias Sobrinho</b></sub>
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

