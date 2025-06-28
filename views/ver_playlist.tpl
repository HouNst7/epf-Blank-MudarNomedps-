<!DOCTYPE html>
<html>
<head>
    <title>{{playlist.nome}}</title>
</head>
<body>
    <h2>Playlist: {{playlist.nome}}</h2>
    % if musicas:
        <ul>
        % for musica in musicas:
            <li>
                <b>{{musica.titulo}}</b> - {{musica.artista}} ({{musica.album}}) [{{musica.duracao}}]
                <a href="/playlists/{{playlist.id}}/remover/{{musica.id}}">Remover</a>
            </li>
        % end
        </ul>
    % else:
        <p>Esta playlist não possui músicas.</p>
    % end
    <a href="/playlists/{{playlist.id}}/adicionar">Adicionar Música</a> |
    <a href="/playlists">Voltar para Playlists</a>
</body>
</html>
