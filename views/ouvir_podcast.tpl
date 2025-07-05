<!DOCTYPE html>
<html>
<head>
    <title>Reproduzindo Podcast</title>
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
    <div class="player-container">
        <h2>Reproduzindo: {{podcast.titulo}}</h2>
        <p><b>Apresentador:</b> {{podcast.apresentador}}</p>
        <p><b>Episódios:</b> {{podcast.episodios}}</p>
        <p><b>Duração total:</b> {{podcast.duracao}}</p>
        <div class="simulacao-player">
            <p>▶️ Simulação de reprodução do podcast...</p>
        </div>
        <a href="/podcasts/{{podcast.id}}">Voltar para detalhes</a>
        <br>
        <a href="/podcasts">Voltar para lista de podcasts</a>
    </div>
</body>
</html>
