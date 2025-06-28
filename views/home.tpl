% rebase('layout.tpl')

<div class="home-container">
    <header class="home-header">
        <img src="/static/img/BottleLogo.png" alt="Logo" class="logo">
        <h1>Bem-vindo ao EPF Music!</h1>
        % if not user:
            <a href="/login" class="btn">Login</a>
            <a href="/register" class="btn">Cadastro</a>
        % else:
            <a href="/albums" class="btn">Álbuns</a>
            <a href="/artists" class="btn">Artistas</a>
            <a href="/songs" class="btn">Músicas</a>
            <a href="/playlists" class="btn">Playlists</a>
            <a href="/logout" class="btn">Logout</a>
        % end
    </header>
    <section class="popular-section">
        <h2>Músicas Populares</h2>
        <div class="popular-list">
            % for song in popular_songs:
                <div class="song-card">
                    <strong>{{song['title']}}</strong><br>
                    Artista: {{song['artist']}}
                </div>
            % end
        </div>
    </section>
    <section class="popular-section">
        <h2>Artistas em Alta</h2>
        <div class="popular-list">
            % for artist in popular_artists:
                <div class="artist-card">
                    <strong>{{artist['name']}}</strong>
                </div>
            % end
        </div>
    </section>
</div>

<style>
.home-container { max-width: 900px; margin: 0 auto; padding: 2em; }
.home-header { display: flex; align-items: center; justify-content: space-between; }
.logo { height: 60px; }
.btn { margin: 0 0.5em; padding: 0.5em 1.2em; background: #1db954; color: #fff; border-radius: 20px; text-decoration: none; font-weight: bold; }
.popular-section { margin-top: 2em; }
.popular-list { display: flex; gap: 1em; flex-wrap: wrap; }
.song-card, .artist-card { background: #222; color: #fff; padding: 1em; border-radius: 10px; min-width: 150px; }
</style>
