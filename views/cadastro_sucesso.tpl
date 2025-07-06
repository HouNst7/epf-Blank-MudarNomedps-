<!DOCTYPE html>
<html>
<head>
    <title>Cadastro Concluído</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(to top, #000000, #1a1a1a);
            font-family: sans-serif;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #2e2e2e;
            padding: 40px;
            border-radius: 15px;
            text-align: center;
            width: 400px;
            box-shadow: 0 0 10px rgba(0,0,0,0.4);
        }

        h2 {
            margin-bottom: 20px;
        }

        .btn-login {
            background: #8a2be2;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 20px;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            display: inline-block;
            margin-top: 10px;
        }

        .btn-login:hover {
            background:rgb(130, 30, 224);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Cadastro realizado com sucesso!</h2>
        <a href="/login" class="btn-login">Ir para login</a>
    </div>
</body>
</html>
