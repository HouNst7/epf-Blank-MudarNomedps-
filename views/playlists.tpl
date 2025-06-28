<!DOCTYPE html>
<html>
<head>
    <title>Playlists</title>
</head>
<body>
    <h2>Minhas Playlists</h2>
    % if playlists:
        <ul>
        % for playlist in playlists:
            <li>
                <a href="/playlists/{{playlist.id}}">{{playlist.nome}}</a> ({{len(playlist.musicas)}} músicas)
                <a href="/playlists/{{playlist.id}}/adicionar">Adicionar Música</a>
            </li>
        % end
        </ul>
    % else:
        <p>Você ainda não tem playlists.</p>
    % end
    <a href="/playlists/nova">Criar nova playlist</a>
    <br><a href="/">Voltar para Home</a>
</body>
</html>
