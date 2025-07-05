<!DOCTYPE html>
<html>
<head>
    <title>Editar Perfil</title>
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
    <h2>Editar Perfil</h2>
    % if erro:
        <p style="color:red">{{erro}}</p>
    % end
    <form action="/perfil" method="post" enctype="multipart/form-data">
        <label>Nome:</label>
        <input type="text" name="nome" value="{{usuario['nome']}}" required><br>
        <label>Email:</label>
        <input type="text" value="{{usuario['email']}}" disabled><br>
        <label>Senha:</label>
        <input type="password" name="senha" value="{{usuario['senha']}}" required><br>
        <label>Tipo:</label>
        % if usuario['tipo'] == 'admin':
            <select name="tipo">
                <option value="admin" {{'selected' if usuario['tipo']=='admin' else ''}}>Admin</option>
                <option value="regular" {{'selected' if usuario['tipo']=='regular' else ''}}>Regular</option>
            </select>
        % else:
            <input type="text" value="Regular" disabled>
        % end
        <br>
        <label>Ícone do usuário:</label>
        % if usuario.get('icone'):
            <img src="{{usuario['icone']}}" alt="Ícone" width="64" height="64"><br>
        % end
        <input type="file" name="icone" accept="image/png, image/jpeg"><br>
        <button type="submit">Salvar Alterações</button>
    </form>
    <form action="/perfil/excluir" method="post" onsubmit="return confirm('Tem certeza que deseja excluir seu perfil?');">
        <button type="submit" style="background:red;color:white;">Excluir Perfil</button>
    </form>
    <a href="/">Voltar para Home</a>
</body>
</html>
