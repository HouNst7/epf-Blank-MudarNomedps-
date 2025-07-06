<!DOCTYPE html>
<html>
<head>
    <title>Novo Podcast</title>
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
            font-size: 16px;
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
        <h2>Novo Podcast</h2>
        % if erro:
            <div class="erro">{{erro}}</div>
        % end
        <form method="post">
            <label for="titulo">Título:</label>
            <input type="text" id="titulo" name="titulo" required>

            <label for="apresentador">Apresentador:</label>
            <input type="text" id="apresentador" name="apresentador" required>

            <label for="episodios">Episódios:</label>
            <input type="text" id="episodios" name="episodios" required>

            <label for="duracao">Duração:</label>
            <input type="text" id="duracao" name="duracao" placeholder="Ex: 12:30" required>

            <label for="descricao">Descrição:</label>
            <textarea id="descricao" name="descricao" rows="4" required></textarea>

            <button class="btn" type="submit">Cadastrar Podcast</button>
        </form>

        <a href="/podcasts" style="color:#8a2be2;display:block;text-align:center;margin-top:20px;">Voltar para Podcasts</a>
    </div>
</body>
</html>
