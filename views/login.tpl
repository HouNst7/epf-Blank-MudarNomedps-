<!DOCTYPE html>
<html>
<head><title>Login</title></head>
<body>
    <h2>Login</h2>
    % if erro:
        <p style="color:red;">{{erro}}</p>
    % end
    <form method="post">
        Email: <input name="email"><br>
        Senha: <input name="senha" type="password"><br>
        <input type="submit" value="Entrar">
    </form>
    <a href="/cadastro">Cadastrar</a>
</body>
</html>
