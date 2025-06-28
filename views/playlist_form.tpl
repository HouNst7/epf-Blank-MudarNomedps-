% rebase('layout', title='Nova/Editar Playlist')

<section class="form-section">
    <h1>{{'Editar Playlist' if playlist else 'Nova Playlist'}}</h1>

    <form action="{{action}}" method="post" class="form-container">
        <div class="form-group">
            <label for="name">Nome da Playlist:</label>
            <input type="text" id="name" name="name" required value="{{playlist.name if playlist else ''}}">
        </div>

        <div class="form-group">
            <label for="user_id">Usuário:</label>
            <select id="user_id" name="user_id" required>
                % for user in users:
                    <option value="{{user.id}}"
                        % if playlist and user.id == playlist.user_id:
                            selected
                        % end
                    >{{user.name}}</option>
                % end
            </select>
        </div>

        <div class="form-group">
            <label>Músicas:</label>
            % for song in songs:
                <div>
                    <input type="checkbox" id="song_{{song.id}}" name="song_ids" value="{{song.id}}"
                        % if playlist and song.id in playlist.song_ids:
                            checked
                        % end
                    >
                    <label for="song_{{song.id}}">{{song.title}}</label>
                </div>
            % end
        </div>

        <div class="form-actions">
            <button type="submit" class="btn-submit">Salvar</button>
            <a href="/playlists" class="btn-cancel">Voltar</a>
        </div>
    </form>
</section>
