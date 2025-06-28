% rebase('layout', title='Adicionar/Editar Música')

<section class="form-section">
    <h1>{{'Editar Música' if song else 'Nova Música'}}</h1>

    <form action="{{action}}" method="post" class="form-container">
        <div class="form-group">
            <label for="title">Título:</label>
            <input type="text" id="title" name="title" required value="{{song.title if song else ''}}">
        </div>

        <div class="form-group">
            <label for="duration">Duração:</label>
            <input type="text" id="duration" name="duration" placeholder="Ex: 3:45" required value="{{song.duration if song else ''}}">
        </div>

        <div class="form-group">
            <label for="album_id">Álbum:</label>
            <select id="album_id" name="album_id" required>
                % for album in albums:
                    <option value="{{album.id}}"
                        % if song and album.id == song.album_id:
                            selected
                        % end
                    >{{album.title}}</option>
                % end
            </select>
        </div>

        <div class="form-actions">
            <button type="submit" class="btn-submit">Salvar</button>
            <a href="/songs" class="btn-cancel">Voltar</a>
        </div>
    </form>
</section>
