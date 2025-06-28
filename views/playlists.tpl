% rebase('layout', title='Playlists')

<section class="playlists-section">
    <div class="section-header">
        <h1>📻 Playlists</h1>
        <a href="/playlists/add" class="btn btn-primary">+ Nova Playlist</a>
    </div>

    <table class="styled-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Usuário</th>
                <th>Músicas</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            % for p in playlists:
            <tr>
                <td>{{p.id}}</td>
                <td>{{p.name}}</td>
                <td>{{users.get(p.user_id, 'Desconhecido')}}</td>
                <td>
                    <ul>
                        % for song_id in p.song_ids:
                            <li>{{songs.get(song_id, 'Música não encontrada')}}</li>
                        % end
                    </ul>
                </td>
                <td>
                    <a href="/playlists/edit/{{p.id}}" class="btn btn-sm">Editar</a>
                    <form action="/playlists/delete/{{p.id}}" method="post" style="display:inline;" onsubmit="return confirm('Excluir playlist?')">
                        <button type="submit" class="btn btn-sm btn-danger">Excluir</button>
                    </form>
                </td>
            </tr>
            % end
        </tbody>
    </table>
</section>
