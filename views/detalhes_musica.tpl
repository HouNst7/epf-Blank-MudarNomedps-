<!DOCTYPE html>
<html>
<head><title>Detalhes da Música</title></head>
<body>
    <h2>{{musica.titulo}}</h2>
    <p><b>Artista:</b> {{musica.artista}}</p>
    <p><b>Álbum:</b> {{musica.album}}</p>
    <p><b>Duração:</b> {{musica.duracao}}</p>
    <form method="post" action="/musicas/{{musica.id}}/tocar">
        <button type="submit">Tocar</button>
    </form>
    <a href="/musicas">Voltar para lista</a>
    <br>
    <a href="/">Voltar para Home</a>
</body>
</html>
