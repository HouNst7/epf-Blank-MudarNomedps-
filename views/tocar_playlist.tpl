<!DOCTYPE html>
<html>
<head><title>Tocando Playlist</title></head>
<body>
    <h2>Tocando Playlist: {{playlist.nome}}</h2>
    % if musicas:
        <ol>
        % for musica in musicas:
            <li><b>{{musica.titulo}}</b> - {{musica.artista}} ({{musica.album}}) [{{musica.duracao}}]</li>
        % end
        </ol>
        <p><i>(Simulação de reprodução sequencial)</i></p>
    % else:
        <p>Esta playlist não possui músicas.</p>
    % end
    <a href="/playlists/{{playlist.id}}">Voltar para Playlist</a>
    <br>
    <a href="/">Voltar para Home</a>
</body>
</html>
