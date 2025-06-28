% rebase('layout', title='Álbuns')

<section class="albums-section">
    <div class="section-header">
        <h1>🎶 Álbuns</h1>
        <a href="/albums/add" class="btn btn-primary">+ Adicionar Álbum</a>
    </div>

    <table class="styled-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Título</th>
                <th>Ano</th>
                <th>Artista</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            % for album in albums:
            <tr>
                <td>{{album.id}}</td>
                <td>{{album.title}}</td>
                <td>{{album.year}}</td>
                <td>{{artists.get(album.artist_id, 'Desconhecido')}}</td>
                <td>
                    <a href="/albums/edit/{{album.id}}" class="btn btn-sm">Editar</a>
                    <form action="/albums/delete/{{album.id}}" method="post" style="display:inline;" onsubmit="return confirm('Excluir álbum?')">
                        <button type="submit" class="btn btn-sm btn-danger">Excluir</button>
                    </form>
                </td>
            </tr>
            % end
        </tbody>
    </table>
</section>
