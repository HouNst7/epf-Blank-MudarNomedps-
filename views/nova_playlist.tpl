<!DOCTYPE html>
<html>
<head>
    <title>Criar Playlist</title>
</head>
<body>
    <h2>Criar Nova Playlist</h2>
    % if erro:
        <p style="color:red;">{{erro}}</p>
    % end
    <form method="post">
        Nome da Playlist: <input name="nome"><br>
        Pública? <input type="checkbox" name="publica" checked> (Se desmarcado, só você verá)<br>
        <input type="submit" value="Criar">
    </form>
    <a href="/playlists">Voltar para Playlists</a>
    <br>
    <a href="/">Voltar para Home</a>
</body>
</html>
