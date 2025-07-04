<!DOCTYPE html>
<html>
<head>
    <title>{{musica.titulo}}</title>
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

        {* container principal centralizado *}
        .container {
            background-color: #2e2e2e;
            padding: 40px;
            border-radius: 20px;
            width: 400px;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
            text-align: center;
        }

        .container h2 {
            margin-top: 0;
            margin-bottom: 20px;
        }

        {* capa da música *}
        .capa-musica {
            position: relative;
            border-radius: 12px;
            overflow: hidden;
            width: 100%;
        }

        .capa-musica img {
            width: 100%;
            display: block;
        }

        {* linha com artista e álbum *}
        .linha-info {
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
            font-size: 14px;
            color: #ccc;
        }

        .linha-info span b {
            color: white;
        }

        {* container dos botões *}
        .btn-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 30px;
            gap: 30px;
        }

        .play-btn {
            background-color: #8a2be2;
            border: none;
            border-radius: 50%;
            width: 65px;
            height: 65px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
        }

        .play-btn img {
            height: 28px;
            margin-left: 2px;
        }

        .btn-cinza {
            background-color: #555;
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
        }

        .btn-cinza img {
            height: 18px;
            margin-left: 1px;
        }

        {* barra de progresso *}
        .barra-progresso {
            position: relative;
            height: 10px;
            background-color: #444;
            border-radius: 5px;
            margin: 30px 0 10px;
        }

        .barra-progresso .progresso {
            height: 100%;
            width: 0%;  /* Progresso inicial */
            background-color: #8a2be2;
            border-radius: 5px;
        }

        .barra-progresso .duracao {
            position: absolute;
            right: 8px;
            bottom: -20px;
            font-size: 12px;
            color: #aaa;
        }

        {* links de navegação *}
        .links-retorno {
            margin-top: 20px;
            font-size: 14px;
        }

        .links-retorno a {
            color: #ccc;
            text-decoration: none;
            display: block;
            margin-top: 5px;
        }

        .links-retorno a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>{{musica.titulo}}</h2>

        <div class="capa-musica">
            <img src="/static/img/capaID{{musica.id}}.png" alt="Capa da música">
        </div>

        <div class="linha-info">
            <span><b>Autor:</b> {{musica.artista}}</span>
            <span><b>Álbum:</b> {{musica.album}}</span>
        </div>

        <div class="btn-container">
            <button class="btn-cinza" title="Música anterior">
                <img src="/static/img/play-button-arrowhead.png" alt="Anterior">
            </button>
            <form method="post" action="/musicas/{{musica.id}}/tocar">
                <button class="play-btn" title="Tocar">
                    <img src="/static/img/play-button-arrowhead.png" alt="Play">
                </button>
            </form>
            <button class="btn-cinza" title="Próxima música">
                <img src="/static/img/play-button-arrowhead.png" alt="Próxima">
            </button>
        </div>

        <div class="barra-progresso">
            <div class="progresso"></div>
            <span class="duracao">{{musica.duracao}}</span>
        </div>

        <div class="links-retorno">
            <a href="/musicas">Retornar para lista de músicas</a>
            <a href="/">Retornar para a página inicial</a>
        </div>
    </div>
</body>
</html>
