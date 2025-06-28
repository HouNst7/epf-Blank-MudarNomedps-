<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
</head>
<body>
    <h1>Bem-vindo ao sistema!</h1>
    % if usuario:
        <span>Olá, {{usuario['nome']}}!</span> |
        <a href="/playlists">Minhas Playlists</a> |
        <a href="/musicas">Músicas</a>
        % if usuario['tipo'] == 'admin':
            | <a href="/musicas/cadastrar">Cadastrar Música</a>
        % end
        | <a href="/logout">Sair</a>
    % else:
        <a href="/login">Login</a> |
        <a href="/cadastro">Cadastro</a>
    % end
</body>
</html>

