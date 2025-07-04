<!DOCTYPE html>
<html>
<head>
    <title>Playlists</title>
</head>
<body>
    <h2>Playlists</h2>
    % if playlists:
        <ul>
        % for playlist in playlists:
            <li>
                <a href="/playlists/{{playlist.id}}">{{playlist.nome}}</a>
                ({{'pública' if playlist.publica else 'privada'}})
                (<b>{{len(playlist.itens)}}</b> itens)
                por {{playlist.usuario_nome or 'desconhecido'}}
                <a href="/playlists/{{playlist.id}}/adicionar">Adicionar Música</a>
            </li>
        % end
        </ul>
    % else:
        <p>Nenhuma playlist encontrada.</p>
    % end
    <a href="/playlists/nova">Criar nova playlist</a>
    <br>
    <a href="/">Voltar para Home</a>
</body>
</html>
