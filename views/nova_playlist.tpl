<!DOCTYPE html>
<html>
<head>
    <title>Criar Playlist</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            background: linear-gradient(to top, #000000, #1a1a1a);
            color: white;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .form-container {
            position: relative;
            background-color: #2e2e2e;
            padding: 30px;
            border-radius: 15px;
            width: 450px;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
            text-align: center;
        }

        .form-container h2 {
            margin-top: 0;
        }

        .form-container form {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            gap: 15px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: none;
            background-color: #3a3a3a;
            color: white;
            font-size: 14px;
        }

        .checkbox-container {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 14px;
        }

        .btn-criar {
            background: #8a2be2;
            color: white;
            padding: 10px;
            width: 100%;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .btn-criar:hover {
            background: rgb(130, 30, 224);
        }

        .erro {
            color: red;
            margin-bottom: 10px;
            font-size: 14px;
        }

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
        
        .btn-home img {
            height: 22px;
            width: 22px;
            margin-right: -2px;
            margin-bottom: 2px;
        }

        .btn-voltar {
            left: 15px;
        }

        .btn-home {
            right: 15px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <!-- Botões nos cantos -->
        <a href="/playlists" class="btn-voltar" title="Voltar">
            <img src="/static/img/return-arrow.png" alt="Voltar">
        </a>
        <a href="/" class="btn-home" title="Home">
            <img src="/static/img/home button.png" alt="Home">
        </a>

        <h2>Criar Nova Playlist</h2>

        % if erro:
            <div class="erro">{{erro}}</div>
        % end

        <form method="post">
            <label for="nome">Nome da Playlist:</label>
            <input type="text" name="nome" id="nome" required>

            <div class="checkbox-container">
                <label><input type="checkbox" name="publica" checked> Pública?</label>
                <span>(Se desmarcado, só você verá)</span>
            </div>

            <input type="submit" value="Criar" class="btn-criar">
        </form>
    </div>
</body>
</html>
