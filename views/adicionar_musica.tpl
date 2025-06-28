<!DOCTYPE html>
<html>
<head>
    <title>Adicionar Música à Playlist</title>
</head>
<body>
    <h2>Adicionar Música à Playlist</h2>
    % if erro:
        <p style="color:red;">{{erro}}</p>
    % end
    <form method="post">
        <label>Escolha a música:</label>
        <select name="musica_id">
            % for musica in musicas:
                <option value="{{musica.id}}">{{musica.titulo}} - {{musica.artista}}</option>
            % end
        </select><br>
        <input type="submit" value="Adicionar">
    </form>
    <a href="/playlists">Voltar para Playlists</a>
</body>
</html>
