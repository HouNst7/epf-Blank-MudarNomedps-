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

        .logo {
            height: 40px;
        }

        .search-bar {
            position: relative;
            width: 50%;
            margin: 0 auto;
        }

        .search-bar input {
            width: 100%;
            padding: 10px 10px 10px 40px;
            border-radius: 25px;
            border: none;
            background-color: #2a2a2a;
            color: white;
            font-size: 16px;
        }

        .search-bar img {
            position: absolute;
            top: 50%;
            left: 10px;
            transform: translateY(-50%);
            height: 20px;
            opacity: 0.7;
        }

        .auth-buttons {
            display: flex;
            gap: 10px;
        }

        .auth-buttons a {
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: bold;
            font-size: 14px;
        }

        .btn-login {
            background-color: white;
            color: black;
        }

        .btn-cadastro {
            background-color: #4caf50;
            color: black;
        }

        .btn-sair {
            background-color: #8b0000;
            color: black;
        }

        .container {
            display: flex;
            height: calc(100vh - 80px);
            padding: 20px;
            gap: 20px;
        }

        .sidebar {
            width: 20%;
            background: linear-gradient(to bottom, #2b2b2b, #1e1e1e);
            border-radius: 15px;
            padding: 20px;
        }

        .sidebar h3 {
            margin-top: 0;
        }

        .sidebar .section {
            margin-top: 30px;
        }

        .main-content {
            flex: 1;
            background: linear-gradient(to bottom, #2e2e2e, #1f1f1f);
            border-radius: 15px;
            padding: 20px;
        }

        .main-content h3 {
            margin-top: 0;
        }

        a.section-link {
            display: block;
            margin-top: 10px;
            color: #ccc;
            text-decoration: none;
        }

        a.section-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header>
        <!-- Logo -->
        <a href="/">
            <img class="logo" src="/media/hounst/HD_Elias/ProjetoFinalOO/epf-Blank-MudarNomedps-/static/img/BottleLogo.png" alt="Logo">
        </a>

        <!-- Barra de pesquisa -->
        <div class="search-bar">
            <img src="/media/hounst/HD_Elias/ProjetoFinalOO/epf-Blank-MudarNomedps-/static/img/lupa.png" alt="Pesquisar">
            <input type="text" placeholder="Qual música você quer escutar agora?">
        </div>

        <!-- Botões de autenticação -->
        <div class="auth-buttons">
            % if usuario:
                <span style="margin-right: 10px;">Olá, {{usuario['nome']}}!</span>
                <a class="btn-sair" href="/logout">Sair</a>
            % else:
                <a class="btn-cadastro" href="/cadastro">Cadastro</a>
                <a class="btn-login" href="/login">Login</a>
            % end
        </div>
    </header>

    <div class="container">
        <!-- Barra lateral esquerda -->
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

                <p>Playlist --nome--</p>
            </div>
        </div>

        <!-- Conteúdo principal -->
        <div class="main-content">
            <h3>Músicas em alta</h3>
            <!-- Conteúdo futuro -->
        </div>
    </div>
</body>
</html>
