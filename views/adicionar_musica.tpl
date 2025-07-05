<!DOCTYPE html>
<html>
<head>
    <title>Adicionar Item à Playlist</title>
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

        .form-container {
            background-color: #2e2e2e;
            padding: 40px;
            border-radius: 20px;
            width: 400px;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
            text-align: center;
        }

        .form-container h2 {
            margin-top: 0;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-top: 20px;
            margin-bottom: 5px;
            font-size: 14px;
        }

        select {
            width: 100%;
            padding: 10px;
            border-radius: 10px;
            border: none;
            background-color: #444;
            color: white;
            font-size: 14px;
        }

        .btn-adicionar {
            background-color: #1e90ff;
            margin-top: 30px;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 20px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .btn-adicionar:hover {
            background-color:rgb(10, 113, 197);
        }

        .btn-voltar {
            margin-top: 15px;
            display: inline-block;
            color: #ccc;
            text-decoration: none;
            font-size: 14px;
        }

        .btn-voltar:hover {
            text-decoration: underline;
        }

        .erro {
            color: red;
            margin-top: -10px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Adicionar Música ou Podcast à Playlist</h2>

        % if erro:
            <div class="erro">{{erro}}</div>
        % end

        <form method="post">
            <label for="tipo-select">Escolha o tipo:</label>
            <select name="tipo" id="tipo-select" onchange="mostrarSelect()">
                <option value="musica">Música</option>
                <option value="podcast">Podcast</option>
            </select>

            <div id="musica-select">
                <label for="musica_id">Música:</label>
                <select name="musica_id">
                    % for musica in musicas:
                        <option value="{{musica.id}}">{{musica.titulo}} - {{musica.artista}}</option>
                    % end
                </select>
            </div>

            <div id="podcast-select" style="display:none;">
                <label for="podcast_id">Podcast:</label>
                <select name="podcast_id">
                    % for podcast in podcasts:
                        <option value="{{podcast.id}}">{{podcast.titulo}} - {{podcast.apresentador}}</option>
                    % end
                </select>
            </div>

            <button type="submit" class="btn-adicionar">Adicionar</button>
        </form>

        <a class="btn-voltar" href="/playlists">Voltar para Playlists</a>
    </div>

    <script>
        function mostrarSelect() {
            var tipo = document.getElementById('tipo-select').value;
            document.getElementById('musica-select').style.display = tipo === 'musica' ? '' : 'none';
            document.getElementById('podcast-select').style.display = tipo === 'podcast' ? '' : 'none';
        }
    </script>
</body>
</html>
