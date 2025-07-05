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

        {* container central *}
        .container {
            position: relative;
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

        {* botão voltar à lista de músicas *}
        .btn-voltar {
            position: absolute;
            top: 15px;
            left: 15px;
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

        {* botão home *}
        .btn-home {
            position: absolute;
            top: 15px;
            right: 15px;
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

        .btn-voltar img,
        .btn-home img {
            height: 18px;
        }

        {* capa da música *}
        .capa-musica {
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

        {* container dos botões de controle *}
        .btn-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 30px;
            gap: 15px;
            margin-right: 75px;
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
        }

        .btn-shuffle {
            background-color: #555;
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            margin-right: 20px;
        }

        .btn-shuffle img {
            height: 18px;
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
            margin-left: 7px;
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
            width: 0%;
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
    </style>
    <script>
        function togglePlay(btn) {
            const img = btn.querySelector('img');
            const isPlaying = img.getAttribute('src') === '/static/img/pause button.png';
            img.setAttribute('src', isPlaying ? '/static/img/play-button-arrowhead.png' : '/static/img/pause button.png');
        }
    </script>
</head>
<body>
    <div class="container">
        <!-- Botão voltar -->
        <a href="/musicas" class="btn-voltar" title="Voltar para lista">
            <img src="/static/img/return-arrow.png" alt="Voltar">
        </a>

        <!-- Botão home -->
        <a href="/" class="btn-home" title="Página inicial">
            <img src="/static/img/home button.png" alt="Home">
        </a>

        <h2>{{musica.titulo}}</h2>

        <!-- Capa -->
        <div class="capa-musica">
            <img src="/static/img/capaID{{musica.id}}.png" alt="Capa da música">
        </div>

        <!-- Info -->
        <div class="linha-info">
            <span><b>Autor:</b> {{musica.artista}}</span>
            <span><b>Álbum:</b> {{musica.album}}</span>
        </div>

        <!-- Botões -->
        <div class="btn-container">
            <button class="btn-shuffle" title="Shuffle">
                <img src="/static/img/shuffle.png" alt="Shuffle">
            </button>
            <button class="btn-cinza" title="Música anterior">
                <img src="/static/img/backward-button.png" alt="Anterior">
            </button>
            <button class="play-btn" title="Tocar/Pausar" onclick="togglePlay(this)">
                <img src="/static/img/play-button-arrowhead.png" alt="Play">
            </button>
            <button class="btn-cinza" title="Próxima música">
                <img src="/static/img/forward-button.png" alt="Próxima">
            </button>
        </div>

        <!-- Barra de progresso -->
        <div class="barra-progresso">
            <div class="progresso"></div>
            <span class="duracao">{{musica.duracao}}</span>
        </div>
    </div>
</body>
</html>
