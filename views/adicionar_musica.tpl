<!DOCTYPE html>
<html>
<head>
    <title>Adicionar Item à Playlist</title>
</head>
<body>
    <h2>Adicionar Música ou Podcast à Playlist</h2>
    % if erro:
        <p style="color:red;">{{erro}}</p>
    % end
    <form method="post">
        <label>Escolha o tipo:</label>
        <select name="tipo" id="tipo-select" onchange="mostrarSelect()">
            <option value="musica">Música</option>
            <option value="podcast">Podcast</option>
        </select><br>
        <div id="musica-select">
            <label>Música:</label>
            <select name="musica_id">
                % for musica in musicas:
                    <option value="{{musica.id}}">{{musica.titulo}} - {{musica.artista}}</option>
                % end
            </select><br>
        </div>
        <div id="podcast-select" style="display:none;">
            <label>Podcast:</label>
            <select name="podcast_id">
                % for podcast in podcasts:
                    <option value="{{podcast.id}}">{{podcast.titulo}} - {{podcast.apresentador}}</option>
                % end
            </select><br>
        </div>
        <input type="submit" value="Adicionar">
    </form>
    <script>
    function mostrarSelect() {
        var tipo = document.getElementById('tipo-select').value;
        document.getElementById('musica-select').style.display = tipo === 'musica' ? '' : 'none';
        document.getElementById('podcast-select').style.display = tipo === 'podcast' ? '' : 'none';
    }
    </script>
    <a href="/playlists">Voltar para Playlists</a>
</body>
</html>
