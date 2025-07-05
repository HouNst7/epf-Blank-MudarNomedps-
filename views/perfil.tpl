<!DOCTYPE html>
<html>
<head>
    <title>Editar Perfil</title>
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
            border-radius: 20px;
            width: 400px;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
            position: relative;
        }

        h2 {
            text-align: center;
            margin-top: 0;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
            text-align: left;
        }

        input[type="text"],
        input[type="password"],
        select {
            width: 100%;
            padding: 10px;
            border-radius: 10px;
            border: none;
            background-color: #444;
            color: white;
        }

        input[disabled] {
            opacity: 0.7;
        }

        .icone-preview {
            display: block;
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 12px;
            margin: 15px auto 10px;
        }

        .file-label {
            display: block;
            text-align: center;
            margin-bottom: 20px;
            color: #1e90ff;
            cursor: pointer;
        }

        .file-label:hover {
            text-decoration: underline;
        }

        input[type="file"] {
            display: none;
        }

        .btn-salvar {
            background-color: #1e90ff;
            color: white;
            padding: 10px;
            width: 100%;
            border: none;
            border-radius: 20px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 15px;
        }

        .btn-salvar:hover {
            background-color: rgb(10, 113, 197);
        }

        .btn-excluir {
            background-color: red;
            color: white;
            padding: 10px;
            width: 100%;
            border: none;
            border-radius: 20px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 10px;
        }

        .btn-excluir:hover {
            background-color: darkred;
        }

        .btn-home {
            position: absolute;
            top: 15px;
            left: 15px;
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

        .btn-home img {
            width: 22px;
            height: 22px;
        }

        senha-container {
            position: relative;
            width: 80%;
        }

        .senha-container input {
            width: 100%;
            padding-right: 10px; 
        }

        .toggle-olho {
            position: absolute;
            top: 50%;
            right: 30px;
            transform: translateY(-375%);
            width: 28px;
            height: 23px;
            cursor: pointer;
        }

    </style>
</head>
<body>
    <div class="container">
        <a href="/" class="btn-home" title="Home">
            <img src="/static/img/home button.png" alt="Home">
        </a>

        <h2>Editar Perfil</h2>

        % if erro:
            <p style="color:red; text-align: center;">{{erro}}</p>
        % end

        <form action="/perfil" method="post" enctype="multipart/form-data">
            <label>Nome:</label>
            <input type="text" name="nome" value="{{usuario['nome']}}" required>

            <label>Email:</label>
            <input type="text" value="{{usuario['email']}}" disabled>

            <label>Senha:</label>
            <div class="senha-container">
                <input type="password" id="senha" name="senha" value="{{usuario['senha']}}" required>
                <img src="/static/img/olho fechado.png" alt="Mostrar senha" id="icone-olho" class="toggle-olho" onclick="toggleSenha()">
            </div>

            <script>
                function toggleSenha() {
                    const input = document.getElementById('senha');
                    const icone = document.getElementById('icone-olho');
                    const aberta = "/static/img/olho fechado.png";
                    const fechada = "/static/img/olho aberto.png";

                    if (input.type === "password") {
                        input.type = "text";
                        icone.src = aberta;
                    } else {
                        input.type = "password";
                        icone.src = fechada;
                    }
                }
            </script>

            <label>Tipo:</label>
            % if usuario['tipo'] == 'admin':
                <select name="tipo">
                    <option value="admin" {{'selected' if usuario['tipo']=='admin' else ''}}>Admin</option>
                    <option value="regular" {{'selected' if usuario['tipo']=='regular' else ''}}>Regular</option>
                </select>
            % else:
                <input type="text" value="Regular" disabled>
            % end

            <label>Ícone de perfil:</label>
            % if usuario.get('icone'):
                <img src="{{usuario['icone']}}" alt="Ícone" class="icone-preview">
            % end

            <label class="file-label">
                Escolher arquivo
                <input type="file" name="icone" accept="image/png, image/jpeg">
            </label>

            <button type="submit" class="btn-salvar">Salvar Alterações</button>
        </form>

        <form action="/perfil/excluir" method="post" onsubmit="return confirm('Tem certeza que deseja excluir seu perfil?');">
            <button type="submit" class="btn-excluir">Excluir Perfil</button>
        </form>
    </div>
</body>
</html>
