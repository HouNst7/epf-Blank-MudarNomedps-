<!DOCTYPE html>
<html>
<head>
    <title>Nova Música</title>
    <style>
        body {
            background: linear-gradient(to top, #000000, #1a1a1a);
            color: white;
            font-family: sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 400px;
            margin: 60px auto;
            background: #232323;
            border-radius: 15px;
            padding: 30px 40px;
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
        input[type="text"], textarea {
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
            cursor: pointer;
            width: 100%;
        }
        .btn:hover {
            background: #6d1bbd;
        }
        .erro {
            color: #ff6b6b;
            margin-bottom: 15px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Nova Música</h2>
        % if erro:
            <div class="erro">{{erro}}</div>
        % end
        <form method="post">
            <label for="titulo">Título:</label>
            <input type="text" id="titulo" name="titulo" required>

            <label for="artista">Artista:</label>
            <input type="text" id="artista" name="artista" required>

            <label for="album">Álbum:</label>
            <input type="text" id="album" name="album">

            <label for="genero">Gênero:</label>
            <input type="text" id="genero" name="genero">

            <button class="btn" type="submit">Cadastrar Música</button>
        </form>
        <a href="/musicas" style="color:#8a2be2;display:block;text-align:center;margin-top:20px;">Voltar para Músicas</a>
    </div>
</body>
</html>
