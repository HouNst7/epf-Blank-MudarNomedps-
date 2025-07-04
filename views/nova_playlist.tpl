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

        {* div central *}
        .form-container {
            background-color: #2e2e2e;
            padding: 30px;
            border-radius: 15px;
            width: 400px;
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

        {* input de texto *}
        input[type="text"] {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: none;
            background-color: #3a3a3a;
            color: white;
            font-size: 14px;
        }

        {* checkbox *}
        .checkbox-container {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 14px;
        }

        {* botão *}
        .btn-criar {
            background-color: #1e90ff;
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
            background-color: #187bcd;
        }

        {* frase-botão *}
        .frase-botao {
            margin-top: 20px;
            color: #ccc;
            font-size: 14px;
            text-decoration: none;
            display: block;
        }

        .frase-botao:hover {
            text-decoration: underline;
        }

        .erro {
            color: red;
            margin-bottom: 10px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="form-container">
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

        <a class="frase-botao" href="/playlists">Retornar para as suas playlists</a>
        <a class="frase-botao" href="/">Retornar para a página inicial</a>
    </div>
</body>
</html>
