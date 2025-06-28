<!DOCTYPE html>
<html>
<head>
    <title>Músicas</title>
</head>
<body>
    <h2>Lista de Músicas</h2>
    <form method="get">
        <input type="text" name="q" placeholder="Buscar por nome, artista ou álbum" value="{{q or ''}}">
        <input type="submit" value="Buscar">
    </form>
    % if musicas:
        <ul>
        % for musica in musicas:
            <li>
                <a href="/musicas/{{musica.id}}"><b>{{musica.titulo}}</b></a> - {{musica.artista}} ({{musica.album}}) [{{musica.duracao}}]
                <form method="post" action="/musicas/{{musica.id}}/tocar" style="display:inline;">
                    <button type="submit">Tocar</button>
                </form>
            </li>
        % end
        </ul>
    % else:
        <p>Nenhuma música cadastrada.</p>
    % end
    % if usuario and usuario['tipo'] == 'admin':
        <a href="/musicas/cadastrar">Cadastrar Música</a><br>
    % end
    <a href="/">Voltar para Home</a>
</body>
</html>
