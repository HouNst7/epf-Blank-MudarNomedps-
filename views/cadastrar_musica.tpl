<!DOCTYPE html>
<html>
<head><title>Cadastrar Música</title></head>
<body>
    <h2>Cadastrar Nova Música</h2>
    % if erro:
        <p style="color:red;">{{erro}}</p>
    % end
    <form method="post">
        Título: <input name="titulo"><br>
        Artista: <input name="artista"><br>
        Álbum: <input name="album"><br>
        Duração (ex: 3:45): <input name="duracao"><br>
        <input type="submit" value="Cadastrar">
    </form>
    <a href="/musicas">Voltar ao catálogo</a>
    <br>
    <a href="/">Voltar para Home</a>
</body>
</html>
