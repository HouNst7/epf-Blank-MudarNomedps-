<!DOCTYPE html>
<html>
<head>
    <title>Músicas</title>
</head>
<body>
    <h2>Lista de Músicas</h2>
    % if musicas:
        <ul>
        % for musica in musicas:
            <li><b>{{musica.titulo}}</b> - {{musica.artista}} ({{musica.album}}) [{{musica.duracao}}]</li>
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
