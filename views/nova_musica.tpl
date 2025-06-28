<!DOCTYPE html>
<html>
<head>
    <title>Adicionar Música</title>
</head>
<body>
    <h2>Adicionar Nova Música</h2>
    % if erro:
        <p style="color:red;">{{erro}}</p>
    % end
    <form method="post">
        Título: <input name="titulo"><br>
        Artista: <input name="artista"><br>
        Álbum: <input name="album"><br>
        Duração: <input name="duracao" placeholder="ex: 3:45"><br>
        <input type="submit" value="Adicionar">
    </form>
    <a href="/musicas">Voltar para Músicas</a>
</body>
</html>
