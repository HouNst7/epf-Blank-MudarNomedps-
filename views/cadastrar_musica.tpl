<!DOCTYPE html>
<html>
<head>
    <title>Cadastrar Música</title>
    <style>
        body {
            background: linear-gradient(to top, #000000, #1a1a1a);
            min-height: 100vh;
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            position: relative;
            width: 400px;
            background: #232323;
            border-radius: 15px;
            padding: 40px 40px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.3);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        input[type="text"], textarea, input[type="file"] {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: none;
            margin-bottom: 18px;
            background: #333;
            color: white;
        }

        .btn {
            background: #8a2be2;
            color: white;
            border: none;
            border-radius: 20px;
            padding: 10px 25px;
            font-weight: bold;
            font-size: 18px;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
        }

        .btn:hover {
            background: #6d1bbd;
        }

        .erro {
            color: #ff6b6b;
            margin-bottom: 15px;
            text-align: center;
        }

        .btn-icone {
            position: absolute;
            background-color: #555;
            border: none;
            border-radius: 50%;
            width: 35px;
            height: 35px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
        }

        .btn-icone img {
            height: 20px;
        }
        
        .btn-voltar {
            top: 15px;
            left: 15px;
        }

        .btn-voltar img {
            height: 30px;
            width: 30px;
            margin-right: 2px;
        }

        .btn-home {
            top: 15px;
            right: 15px;
        }

        .btn-home img {
            height: 22px;
            width: 22px;
            margin-right: -2px;
            margin-bottom: 2px;
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="/musicas" class="btn-icone btn-voltar" title="Voltar">
            <img src="/static/img/return-arrow.png" alt="Voltar">
        </a>
        <a href="/" class="btn-icone btn-home" title="Home">
            <img src="/static/img/home button.png" alt="Home">
        </a>

        <h2>Cadastrar Música</h2>

        % if erro:
            <div class="erro">{{erro}}</div>
        % end

        <form method="post" enctype="multipart/form-data">
            <label for="titulo">Título:</label>
            <input type="text" id="titulo" name="titulo" required>

            <label for="artista">Artista:</label>
            <input type="text" id="artista" name="artista" required>

            <label for="album">Álbum:</label>
            <input type="text" id="album" name="album">

            <label for="genero">Gênero:</label>
            <input type="text" id="genero" name="genero">

            <label for="duracao">Duração:</label>
            <input type="text" id="duracao" name="duracao" placeholder="Ex: 3:45">

            <label for="icone">Imagem da música (PNG/JPG):</label>
            <input type="file" id="icone" name="icone" accept="image/png, image/jpeg">

            <button class="btn" type="submit">Cadastrar Música</button>
        </form>
    </div>
</body>
</html>
