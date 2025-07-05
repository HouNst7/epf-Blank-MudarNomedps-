<!DOCTYPE html>
<html>
<head>
    <title>Podcasts</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            background: linear-gradient(to top, #000000, #1a1a1a);
            color: white;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background-color: #2e2e2e;
            padding: 40px;
            border-radius: 20px;
            width: 500px;
            height: 800px;
            position: relative;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }

        .container h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        ul {
            list-style: none;
            padding-left: 0;
        }

        li {
            margin-bottom: 15px;
            font-size: 14px;
        }

        a {
            color: #8a2be2;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .btn-nav {
            position: absolute;
            top: 20px;
            background-color: #555;
            border: none;
            border-radius: 50%;
            width: 35px;
            height: 35px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
        }

        .btn-home {
            left: 20px;
        }

        .btn-add {
            right: 20px;
        }

        .btn-nav img {
            height: 25px;
            width: 25px;
        }

        .nenhum {
            text-align: center;
            font-size: 14px;
            color: #ccc;
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="/" class="btn-nav btn-home" title="Início">
            <img src="/static/img/home button.png" alt="Home">
        </a>

        % if usuario and usuario['tipo'] == 'admin':
            <a href="/podcasts/novo" class="btn-nav btn-add" title="Cadastrar novo podcast">
                <img src="/static/img/adicao button.png" alt="Adicionar">
            </a>
        % end

        <h2>Podcasts</h2>

        % if podcasts:
            <ul>
                % for podcast in podcasts:
                    <li>
                        <a href="/podcasts/{{podcast.id}}"><b>{{podcast.titulo}}</b></a> – Apresentador: {{podcast.apresentador}} ({{podcast.episodios}} episódios, {{podcast.duracao}})
                    </li>
                % end
            </ul>
        % else:
            <p class="nenhum">Nenhum podcast cadastrado.</p>
        % end
    </div>
</body>
</html>
