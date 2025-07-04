<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            background: linear-gradient(to top, #000000, #1a1a1a);
            color: white;
            height: 100vh;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
        }

        {* logo do site *}
        .logo {
            height: 40px;
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
            background-color: #8b0000;
            color: white;
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: bold;
            font-size: 14px;
            margin-top: -20px;
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
        }

        .sidebar h3, .sidebar h4 {
            margin-top: 0;
        }

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
            background-color: #4caf50;
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
            height: 25px;
            margin-left: 3px;
        }
    </style>
</head>
<body>
    <header>
        <!-- Logo -->
        <a href="/">
            <img class="logo" src="/static/img/BottleLogo.png" alt="Logo">
        </a>

        <!-- Pesquisa + Botão Home -->
        <div class="search-area">
            <form method="get" class="search-bar">
                <input type="text" name="q" placeholder="Busca por nome, artista ou álbum" value="{{q or ''}}">
                <button type="submit" style="all:unset;cursor:pointer;">
                    <img src="/static/img/lupa-branca.png" alt="Buscar">
                </button>
            </form>
        </div>

        <!-- Autenticação -->
        <div class="modulo-autenticacao">
            % if usuario:
                <span>Olá, {{usuario['nome']}}!</span>
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
            <h3>
                % if usuario:
                    <a class="section-link" href="/musicas">Suas músicas</a>
                % else:
                    Suas músicas
                % end
            </h3>
            <div class="section">
                <h4>
                    % if usuario:
                        <a class="section-link" href="/playlists">Minhas Playlists</a>
                    % else:
                        Minhas Playlists
                    % end
                </h4>
                % if usuario:
                    % if playlists_usuario:
                        <ul style="margin-left:10px;">
                        % for p in playlists_usuario:
                            <li><a class="section-link" href="/playlists/{{p.id}}">{{p.nome}}</a></li>
                        % end
                        </ul>
                    % else:
                        <p style="margin-left:10px; color:#aaa;">Nenhuma playlist sua.</p>
                    % end
                % end
            </div>
            <div class="section">
                <h4>Playlists Públicas</h4>
                % if playlists_publicas:
                    <ul style="margin-left:10px;">
                    % for p in playlists_publicas:
                        <li><a class="section-link" href="/playlists/{{p.id}}">{{p.nome}}</a></li>
                    % end
                    </ul>
                % else:
                    <p style="margin-left:10px; color:#aaa;">Nenhuma playlist pública.</p>
                % end
            </div>
            <div class="section">
                <h4>
                    <a class="section-link" href="/podcasts">Podcasts</a>
                </h4>
                % if usuario and usuario['tipo'] == 'admin':
                    <a class="section-link" href="/podcasts/novo">Cadastrar Podcast</a>
                % end
            </div>
        </div>

        <!-- Conteúdo principal -->
        <div class="main-content">
            <h3>Músicas em alta</h3>
            <div class="grid-musicas">
                % if q and resultados_musicas:
                    % for musica in resultados_musicas:
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
                % elif q and not resultados_musicas:
                    <div style="grid-column: 1 / -1; text-align: center; color: #ccc; margin-top: 30px;">
                        Nenhuma música encontrada para "{{q}}".
                    </div>
                % else:
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
                % end
            </div>
        </div>
    </div>
</body>
</html>
