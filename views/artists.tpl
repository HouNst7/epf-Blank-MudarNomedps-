% rebase('layout', title='Artistas')

<section class="artists-section">
    <div class="section-header">
        <h1>🎵 Artistas</h1>
        <a href="/artists/add" class="btn btn-primary">+ Adicionar Artista</a>
    </div>

    <table class="styled-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Gênero</th>
                <th>Descrição</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            % for artist in artists:
            <tr>
                <td>{{artist.id}}</td>
                <td>{{artist.name}}</td>
                <td>{{artist.genre}}</td>
                <td>{{artist.description}}</td>
                <td>
                    <a href="/artists/edit/{{artist.id}}" class="btn btn-sm">Editar</a>
                    <form action="/artists/delete/{{artist.id}}" method="post" style="display:inline;" onsubmit="return confirm('Excluir artista?')">
                        <button type="submit" class="btn btn-sm btn-danger">Excluir</button>
                    </form>
                </td>
            </tr>
            % end
        </tbody>
    </table>
</section>
