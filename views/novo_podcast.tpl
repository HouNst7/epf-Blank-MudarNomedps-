<!DOCTYPE html>
<html>
<head><title>Novo Podcast</title></head>
<body>
    <h2>Cadastrar Podcast</h2>
    % if erro:
        <p style="color:red;">{{erro}}</p>
    % end
    <form method="post">
        Título: <input name="titulo"><br>
        Apresentador: <input name="apresentador"><br>
        Nº de episódios: <input name="episodios" type="number" min="1"><br>
        Duração total (ex: 10:00): <input name="duracao"><br>
        <input type="submit" value="Cadastrar">
    </form>
    <a href="/podcasts">Voltar para Podcasts</a>
    <br>
    <a href="/">Voltar para Home</a>
</body>
</html>
