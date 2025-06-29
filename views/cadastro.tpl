<!DOCTYPE html>
<html>
<head>
    <title>Cadastro</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            background: linear-gradient(to top, #000000, #1a1a1a);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
        }

        .cadastro-container {
            background-color: #1e1e1e;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.05);
            width: 380px;
        }

        .cadastro-container h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .form-group {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }

        .form-group label {
            margin-right: 10px;
            width: 30%;
        }

        .form-group input,
        .form-group select {
            width: 65%;
            padding: 5px;
            border: none;
            border-radius: 5px;
        }

        .cadastro-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-size: 16px;
        }

        .cadastro-container a {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #ddd;
            text-decoration: none;
        }

        .cadastro-container a:hover {
            text-decoration: underline;
        }

        .error {
            color: #ff6666;
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="cadastro-container">
        <h2>Faça seu cadastro</h2>
        % if erro:
            <div class="error">{{erro}}</div>
        % end
        <form method="post">
            <div class="form-group">
                <label for="nome">Nome:</label>
                <input name="nome" id="nome" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input name="email" id="email" type="email" required>
            </div>
            <div class="form-group">
                <label for="senha">Senha:</label>
                <input name="senha" id="senha" type="password" required>
            </div>
            <div class="form-group">
                <label for="tipo">Tipo:</label>
                <select name="tipo" id="tipo">
                    <option value="regular" selected>Usuário comum</option>
                    <option value="admin">Administrador</option>
                </select>
            </div>
            <input type="submit" value="Cadastrar">
        </form>
        <a href="/login">Ir para Login</a>
        <a href="/">Voltar para Home</a>
    </div>
</body>
</html>
