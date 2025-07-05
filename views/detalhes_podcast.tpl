<!DOCTYPE html>
<html>
<head><title>Detalhes do Podcast</title></head>
<body>
    <h2>{{podcast.titulo}}</h2>
    <p><b>Apresentador:</b> {{podcast.apresentador}}</p>
    <p><b>Nº de episódios:</b> {{podcast.episodios}}</p>
    <p><b>Duração total:</b> {{podcast.duracao}}</p>
    <a href="/podcast/{{podcast.id}}/ouvir" class="btn">Ouvir Podcast</a>
    <br><br>
    <a href="/podcasts">Voltar para Podcasts</a>
    <br>
    <a href="/">Voltar para Home</a>
</body>
</html>
