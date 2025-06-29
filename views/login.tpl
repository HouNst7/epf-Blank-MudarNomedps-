<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
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

        .login-container {
            background-color: #1e1e1e;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.05);
            width: 350px;
        }

        .login-container h2 {
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

        .form-group input {
            width: 65%;
            padding: 5px;
            border: none;
            border-radius: 5px;
        }

        .login-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-size: 16px;
        }

        .login-container a {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #ddd;
            text-decoration: none;
        }

        .login-container a:hover {
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
    <div class="login-container">
        <h2>Faça login no site</h2>
        % if erro:
            <div class="error">{{erro}}</div>
        % end
        <form method="post">
            <div class="form-group">
                <label for="email">Email:</label>
                <input name="email" id="email" type="email" required>
            </div>
            <div class="form-group">
                <label for="senha">Senha:</label>
                <input name="senha" id="senha" type="password" required>
            </div>
            <input type="submit" value="Entrar">
        </form>
        <a href="/cadastro">Cadastrar</a>
        <a href="/">Voltar para Home</a>
    </div>
</body>
</html>
