<!DOCTYPE html>
<html>
<head><title>Podcasts</title></head>
<body>
    <h2>Podcasts</h2>
    <a href="/podcasts/novo">Cadastrar novo podcast</a>
    % if podcasts:
        <ul>
        % for podcast in podcasts:
            <li>
                <a href="/podcasts/{{podcast.id}}"><b>{{podcast.titulo}}</b></a> - Apresentador: {{podcast.apresentador}} ({{podcast.episodios}} episódios, {{podcast.duracao}})
            </li>
        % end
        </ul>
    % else:
        <p>Nenhum podcast cadastrado.</p>
    % end
    <a href="/">Voltar para Home</a>
</body>
</html>
