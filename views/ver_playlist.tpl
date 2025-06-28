<!DOCTYPE html>
<html>
<head>
    <title>{{playlist.nome}}</title>
</head>
<body>
    <h2>Playlist: {{playlist.nome}}</h2>
    <form method="post" action="/playlists/{{playlist.id}}/tocar">
        <button type="submit">Tocar Playlist</button>
    </form>
    % if itens:
        <ul>
        % for item in itens:
            <li>
                % if item['tipo'] == 'musica':
                    <b>{{item['obj'].titulo}}</b> - {{item['obj'].artista}} ({{item['obj'].album}}) [{{item['obj'].duracao}}]
                % elif item['tipo'] == 'podcast':
                    <b>{{item['obj'].titulo}}</b> (Podcast) - Apresentador: {{item['obj'].apresentador}} ({{item['obj'].episodios}} episódios, {{item['obj'].duracao}})
                % end
            </li>
        % end
        </ul>
    % else:
        <p>Esta playlist não possui itens.</p>
    % end
    <a href="/playlists/{{playlist.id}}/adicionar">Adicionar Música ou Podcast</a> |
    <a href="/playlists">Voltar para Playlists</a>
</body>
</html>
