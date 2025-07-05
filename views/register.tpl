<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
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
        input[type="text"], input[type="email"], input[type="password"] {
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
        <h2>Cadastro</h2>
        % if erro:
            <div class="erro">{{erro}}</div>
        % end
        <form method="post">
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" required>

            <label for="email">E-mail:</label>
            <input type="email" id="email" name="email" required>

            <label for="senha">Senha:</label>
            <input type="password" id="senha" name="senha" required>

            <button class="btn" type="submit">Cadastrar</button>
        </form>
        <a href="/login" style="color:#8a2be2;display:block;text-align:center;margin-top:20px;">Já tem conta? Login</a>
    </div>
</body>
</html>
