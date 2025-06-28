% rebase('layout.tpl')
<div class="auth-container">
    <h2>Cadastro</h2>
    % if error:
        <div class="error">{{error}}</div>
    % end
    <form method="post" action="/register">
        <label>Nome:</label>
        <input type="text" name="name" required><br>
        <label>Email:</label>
        <input type="email" name="email" required><br>
        <label>Senha:</label>
        <input type="password" name="password" required><br>
        <label>Data de nascimento:</label>
        <input type="date" name="birthdate" required><br>
        <button type="submit" class="btn">Cadastrar</button>
    </form>
    <p>Já tem conta? <a href="/login">Entrar</a></p>
</div>
<style>
.auth-container { max-width: 400px; margin: 2em auto; background: #222; color: #fff; padding: 2em; border-radius: 10px; }
label { display: block; margin-top: 1em; }
input { width: 100%; padding: 0.5em; margin-top: 0.2em; border-radius: 5px; border: none; }
.btn { margin-top: 1em; width: 100%; }
.error { color: #ff5252; margin-bottom: 1em; }
</style>
