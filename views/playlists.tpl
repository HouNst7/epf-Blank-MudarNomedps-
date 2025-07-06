<!DOCTYPE html>
<html>
<head>
    <title>Playlists</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            background: linear-gradient(to top, #000000, #1a1a1a);
            color: white;
            height: 100%;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
        }

        {* logo do site *}
        .logo {
            height: 45px;
        }

        {* área de cima que conteḿ barra de pesquisa e botões *}
        .search-area {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            gap: 50px;
        }

        {* barra de pesquisa *}
        .search-bar {
            position: relative;
            width: 35%;
        }

        .search-bar input {
            width: 100%;
            padding: 10px 40px 10px 15px;
            border-radius: 25px;
            border: none;
            background-color: #2a2a2a;
            color: white;
            font-size: 16px;
        }

        {* lupa *}
        .search-bar img {
            position: absolute;
            top: 36%;
            right: -40px;
            transform: translateY(-50%);
            height: 20px;
            opacity: 0.8;
        }

        .btn-sair {
            background:rgb(184, 17, 17);
            color: white;
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: bold;
            font-size: 14px;
            margin-top: -20px;
        }

        .btn-sair:hover{
            background:rgb(182, 13, 13);
        }

        {* container principal *}
        .container {
            display: flex;
            height: calc(100vh - 80px);
            padding: 20px;
            gap: 20px;
        }

        {* container menor, lado esquerdo *}
        .sidebar {
            width: 20%;
            background: linear-gradient(to bottom, #2b2b2b, #1e1e1e);
            border-radius: 15px;
            padding: 20px;
            overflow-y: auto;
        }

        .sidebar h3 {
            margin-top: 0;
        }

        {* lista de playlists *}
        ul.playlist-list {
            list-style: none;
            padding: 0;
            margin-top: 20px;
        }

        ul.playlist-list li {
            margin-bottom: 15px;
            background-color: #3a3a3a;
            padding: 10px 15px;
            border-radius: 10px;
        }

        ul.playlist-list li a {
            color: #8a2be2;
            font-weight: bold;
            text-decoration: none;
        }

        ul.playlist-list li a:hover {
            text-decoration: underline;
        }

        .playlist-meta {
            color: #ccc;
            font-size: 13px;
        }

        .criar-playlist {
            display: inline-block;
            margin-top: 20px;
            padding: 8px 16px;
            background: #8a2be2;
            color: black;
            font-weight: bold;
            text-decoration: none;
            border-radius: 20px;
        }

        .criar-playlist:hover{
            background:rgb(130, 30, 224);
        }

        {* conteúdo do container principal *}
        .main-content {
            flex: 1;
            background: linear-gradient(to bottom, #2e2e2e, #1f1f1f);
            border-radius: 15px;
            padding: 20px;
            overflow-y: auto;
        }

        .main-content h3 {
            margin-top: 0;
        }

        {* Frases-botões com link no canto esquerdo *}
        .section-link {
            display: block;
            margin-top: 10px;
            color: #ccc;
            text-decoration: none;
        }

        .section-link:hover {
            text-decoration: underline;
        }

        {* mensagem de "olá, usuário" *}
        .modulo-autenticacao {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-top: 22px;
        }

        .modulo-autenticacao img {
            width: 50px;
            height: 50px;
            margin-top: -20px;
        }

        {* letra da mensagem de "olá, usuário" *}
        .modulo-autenticacao span {
            font-weight: bold;
            margin-top: -25px;
        }

        .btn-login {
            background-color: white;
            color: black;
            padding: 8px 16px;
            border-radius: 20px;
            text-decoration: none;
            font-weight: bold;
            font-size: 14px;
        }

        .btn-cadastro {
            background-color: #8a2be2;
            color: black;
            padding: 8px 16px;
            border-radius: 20px;
            text-decoration: none;
            font-weight: bold;
            font-size: 14px;
        }

        {* grade das músicas *}
        .grid-musicas {
            display: grid;
            grid-template-columns: repeat(6, 1fr);
            gap: 20px;
            margin-top: 20px;
        }

        .capa-musica {
            position: relative;
            border-radius: 12px;
            overflow: hidden;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .capa-musica img {
            width: 100%;
            display: block;
        }

        .info-musica {
            text-align: center;
            margin-top: 8px;
        }

        .titulo {
            font-weight: bold;
            font-size: 14px;
        }

        .autor {
            font-size: 12px;
            color: #ccc;
        }

        {* efeitos de hover ao passar o mouse em cima da capa *}
        .hover-overlay {
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background-color: rgba(102, 47, 47, 0.05);
            opacity: 0;
            transition: opacity 0.3s ease;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .capa-musica:hover .hover-overlay {
            opacity: 1;
        }

        .capa-musica:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        {* botão de play da música *}
        .play-btn {
            background-color: #8a2be2;
            border: none;
            border-radius: 50%;
            width: 45px;
            height: 45px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-left: 155px;
            margin-top: 115px;
        }

        .play-btn img {
            width: 25px;
            height: 25px;
            margin-left: 3px;
        }

        .{* botão home *}
        .home-btn {
            background: none;
            border: none;
            cursor: pointer;
            margin: 10px;
            margin-left: 10px;
            margin-top: -4px;
        }

        .home-btn img {
            height: 30px;
        }

    </style>
</head>
<body>
    <header>
        <!-- Logo -->
        <a href="/">
            <img class="logo" src="/static/img/logo_gamafy.png" alt="Logo">
        </a>

        <!-- Pesquisa -->
        <div class="search-area">
            <form method="get" class="search-bar">
                <input type="text" name="q" placeholder="Busca por nome, artista ou álbum">
                <button type="submit" style="all:unset;cursor:pointer;">
                    <img src="/static/img/lupa-branca.png" alt="Buscar">
                </button>
            </form>
             <a href="/" class="home-btn" title="Home">
                <img src="/static/img/home button2.png" alt="Home" />
             </a>
        </div>

        <!-- Autenticação -->
        <div class="modulo-autenticacao">
            % if usuario:
                <span>
                    <a href="/perfil" style="color:inherit;text-decoration:none;">{{usuario['nome']}}</a>
                </span>
                % if usuario.get('icone'):
                    <a href="/perfil">
                        <img src="{{usuario['icone']}}" alt="Ícone" width="32" height="32" style="vertical-align:middle;border-radius:50%;margin-left:8px;">
                    </a>
                % end
                <a class="btn-sair" href="/logout">Sair</a>
            % else:
                <a class="btn-cadastro" href="/cadastro">Cadastro</a>
                <a class="btn-login" href="/login">Login</a>
            % end
        </div>
    </header>

    <div class="container">
        <!-- Barra lateral -->
        <div class="sidebar">
            <h3>Suas playlists</h3>
            % if playlists:
                <ul class="playlist-list">
                    % for playlist in playlists:
                    <li>
                        <a href="/playlists/{{playlist.id}}">{{playlist.nome}}</a>
                        <div class="playlist-meta">
                            {{'pública' if playlist.publica else 'privada'}} —
                            {{len(playlist.itens)}} músicas —
                            por {{playlist.usuario_nome or 'desconhecido'}}
                        </div>
                        <a href="/playlists/{{playlist.id}}/adicionar" class="section-link">Adicionar música</a>
                        % if usuario and (playlist.usuario_id == usuario['id'] or usuario['tipo'] == 'admin'):
                        <form action="/playlists/{{playlist.id}}/excluir" method="post" style="display:inline;" onsubmit="return confirm('Tem certeza que deseja excluir esta playlist?');">
                            <button type="submit" style="background:#8b0000;color:white;border:none;padding:4px 10px;border-radius:8px;cursor:pointer;">Excluir</button>
                        </form>
                        % end
                    </li>
                    % end
                </ul>
            % else:
                <p>Nenhuma playlist encontrada.</p>
            % end

            <a class="criar-playlist" href="/playlists/nova">Criar nova playlist</a>
        </div>

        <!-- Conteúdo principal -->
        <div class="main-content">
            <h3>Músicas populares</h3>
            <div class="grid-musicas">
                % for musica in musicas[:18]:
                <div class="capa-musica">
                    <img src="/static/img/capaID{{musica.id}}.png" alt="Capa da música">
                    <div class="hover-overlay">
                        <a href="/musicas/{{musica.id}}" class="play-btn">
                            <img src="/static/img/play-button-arrowhead.png" alt="Play">
                        </a>
                    </div>
                    <div class="info-musica">
                        <div class="titulo">{{musica.titulo}}</div>
                        <div class="autor">{{musica.artista}}</div>
                    </div>
                </div>
                % end
            </div>
        </div>
    </div>
</body>
</html>
