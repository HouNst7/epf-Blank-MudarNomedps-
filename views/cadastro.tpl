<!DOCTYPE html>
<html>
<head><title>Cadastro</title></head>
<body>
    <h2>Cadastro</h2>
    % if erro:
        <p style="color:red;">{{erro}}</p>
    % end
    <form method="post">
        Nome: <input name="nome"><br>
        Email: <input name="email"><br>
        Senha: <input name="senha" type="password"><br>
        <input type="submit" value="Cadastrar">
    </form>
    <a href="/login">Ir para Login</a>
</body>
</html>
