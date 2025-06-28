% rebase('layout', title='Adicionar/Editar Álbum')

<section class="form-section">
    <h1>{{'Editar Álbum' if album else 'Novo Álbum'}}</h1>

    <form action="{{action}}" method="post" class="form-container">
        <div class="form-group">
            <label for="title">Título:</label>
            <input type="text" id="title" name="title" required value="{{album.title if album else ''}}">
        </div>

        <div class="form-group">
            <label for="year">Ano:</label>
            <input type="number" id="year" name="year" required value="{{album.year if album else ''}}">
        </div>

        <div class="form-group">
            <label for="artist_id">Artista:</label>
            <select id="artist_id" name="artist_id" required>
                % for artist in artists:
                    <option value="{{artist.id}}"
                        % if album and artist.id == album.artist_id:
                            selected
                        % end
                    >{{artist.name}}</option>
                % end
            </select>
        </div>

        <div class="form-actions">
            <button type="submit" class="btn-submit">Salvar</button>
            <a href="/albums" class="btn-cancel">Voltar</a>
        </div>
    </form>
</section>
