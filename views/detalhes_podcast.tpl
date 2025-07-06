<!DOCTYPE html>
<html>
<head>
    <title>{{podcast.titulo}}</title>
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
            position: relative;
            background-color: #2e2e2e;
            padding: 40px;
            border-radius: 20px;
            width: 400px;
            height: 200px;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
            text-align: center;
        }

        .container h2 {
            margin-top: 0;
            margin-bottom: 20px;
        }

        .btn-voltar,
        .btn-home {
            position: absolute;
            top: 15px;
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

        .btn-voltar {
            left: 15px;
        }

        .btn-home {
            right: 15px;
        }

        .btn-voltar img {
            height: 28px;
            margin-right: 2px;
            margin-bottom: 1px;
        }

        .btn-home img {
            height: 22px;
            margin-right: -1px;
            margin-bottom: 1px;
        }

        .info {
            margin: 10px 0;
            font-size: 15px;
        }

        .info b {
            color: #ccc;
        }

        .play-container {
            display: flex;
            justify-content: center;
            margin-top: 30px;
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

        .play-btn img.pause-style {
            filter: brightness(1.2);
            margin-right: 7px;
        }
    </style>
    <script>
        function togglePlay(btn) {
            const img = btn.querySelector('img');
            const isPause = img.getAttribute('src') === '/static/img/pause button.png';

            if (isPause) {
                img.setAttribute('src', '/static/img/play-button-arrowhead.png');
                img.classList.remove('pause-style');
            } else {
                img.setAttribute('src', '/static/img/pause button.png');
                img.classList.add('pause-style');
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <!-- Botão voltar -->
        <a href="/podcasts" class="btn-voltar" title="Voltar para Podcasts">
            <img src="/static/img/return-arrow.png" alt="Voltar">
        </a>

        <!-- Botão home -->
        <a href="/" class="btn-home" title="Página inicial">
            <img src="/static/img/home button.png" alt="Home">
        </a>

        <h2>{{podcast.titulo}}</h2>

        <div class="info"><b>Apresentador:</b> {{podcast.apresentador}}</div>
        <div class="info"><b>Nº de episódios:</b> {{podcast.episodios}}</div>
        <div class="info"><b>Duração total:</b> {{podcast.duracao}}</div>

        <!-- Botão de play -->
        <div class="play-container">
            <button class="play-btn" title="Ouvir/Pausar" onclick="togglePlay(this)">
                <img src="/static/img/play-button-arrowhead.png" alt="Ouvir">
            </button>
        </div>
    </div>
</body>
</html>
