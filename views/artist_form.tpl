% rebase('layout', title='Adicionar/Editar Artista')

<section class="form-section">
    <h1>{{'Editar Artista' if artist else 'Novo Artista'}}</h1>

    <form action="{{action}}" method="post" class="form-container">
        <div class="form-group">
            <label for="name">Nome:</label>
            <input type="text" id="name" name="name" required value="{{artist.name if artist else ''}}">
        </div>

        <div class="form-group">
            <label for="genre">Gênero:</label>
            <input type="text" id="genre" name="genre" required value="{{artist.genre if artist else ''}}">
        </div>

        <div class="form-group">
            <label for="description">Descrição:</label>
            <textarea id="description" name="description" required>{{artist.description if artist else ''}}</textarea>
        </div>

        <div class="form-actions">
            <button type="submit" class="btn-submit">Salvar</button>
            <a href="/artists" class="btn-cancel">Voltar</a>
        </div>
    </form>
</section>
