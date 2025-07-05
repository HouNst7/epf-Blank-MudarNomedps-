<!DOCTYPE html>
<html>
<head>
    <title>Cadastrar Podcast</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            background: linear-gradient(to top, #000000, #1a1a1a);
            color: white;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background-color: #2e2e2e;
            padding: 40px;
            border-radius: 20px;
            width: 400px;
            position: relative;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }

        .container h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            font-size: 14px;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 10px;
            border: none;
            background-color: #444;
            color: white;
            font-size: 14px;
        }

        .btn-cadastrar {
            background-color: #1e90ff;
            margin-top: 10px;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 20px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            width: 100%;
        }

        .btn-cadastrar:hover {
            background-color: rgb(10, 113, 197);
        }

        .btn-nav {
            position: absolute;
            top: 20px;
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

        .btn-voltar {
            left: 20px;
        }

        .btn-home {
            right: 20px;
        }

        .btn-nav img {
            height: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="/podcasts" class="btn-nav btn-voltar" title="Voltar">
            <img src="/static/img/return-arrow.png" alt="Voltar">
        </a>
        <a href="/" class="btn-nav btn-home" title="Home">
            <img src="/static/img/home button.png" alt="Home">
        </a>

        <h2>Cadastrar Podcast</h2>
        <form method="post">
            <label for="titulo">Título:</label>
            <input type="text" name="titulo" id="titulo" required>

            <label for="apresentador">Apresentador:</label>
            <input type="text" name="apresentador" id="apresentador" required>

            <label for="episodios">Nº de episódios:</label>
            <input type="number" name="episodios" id="episodios" required>

            <label for="duracao">Duração total (ex: 10:00):</label>
            <input type="text" name="duracao" id="duracao" required>

            <button type="submit" class="btn-cadastrar">Cadastrar</button>
        </form>
    </div>
</body>
</html>
