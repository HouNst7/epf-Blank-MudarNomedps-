% rebase('layout', title='Músicas')

<section class="songs-section">
    <div class="section-header">
        <h1>🎵 Músicas</h1>
        <a href="/songs/add" class="btn btn-primary">+ Adicionar Música</a>
    </div>

    <table class="styled-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Título</th>
                <th>Duração</th>
                <th>Álbum</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            % for song in songs:
            <tr>
                <td>{{song.id}}</td>
                <td>{{song.title}}</td>
                <td>{{song.duration}}</td>
                <td>{{albums.get(song.album_id, 'Desconhecido')}}</td>
                <td>
                    <a href="/songs/edit/{{song.id}}" class="btn btn-sm">Editar</a>
                    <form action="/songs/delete/{{song.id}}" method="post" style="display:inline;" onsubmit="return confirm('Excluir música?')">
                        <button type="submit" class="btn btn-sm btn-danger">Excluir</button>
                    </form>
                </td>
            </tr>
            % end
        </tbody>
    </table>
</section>
