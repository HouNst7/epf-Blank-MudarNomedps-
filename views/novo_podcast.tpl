<!DOCTYPE html>
<html>
<head>
    <title>Novo Podcast</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            background: linear-gradient(to top, #000000, #1a1a1a);
            color: white;
            height: 100%;
        }
        .container {
            position: relative;
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

        /* Botões */
        .btn-voltar, .btn-home {
            position: absolute;
            top: 15px;
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

        .btn-voltar img {
            height: 30px;
            width: 30px;
            margin-right: 2px;
        }

        .btn-home {
            top: 15px;
            right: 15px;
        }

        .btn-voltar {
            right: 430px;
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
        <!-- Botão voltar -->
        <a href="/podcasts" class="btn-voltar" title="Voltar para Podcasts">
            <img src="/static/img/return-arrow.png" alt="Voltar">
        </a>

        <!-- Botão home -->
        <a href="/" class="btn-home" title="Página inicial">
            <img src="/static/img/home button.png" alt="Home">
        </a>

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
    </div>
</body>
</html>
