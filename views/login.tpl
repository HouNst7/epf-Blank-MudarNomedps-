% rebase('layout.tpl')
<div class="auth-container">
    <h2>Login</h2>
    % if error:
        <div class="error">{{error}}</div>
    % end
    <form method="post" action="/login">
        <label>Email:</label>
        <input type="email" name="email" required><br>
        <label>Senha:</label>
        <input type="password" name="password" required><br>
        <button type="submit" class="btn">Entrar</button>
    </form>
    <p>Não tem conta? <a href="/register">Cadastre-se</a></p>
</div>
<style>
.auth-container { max-width: 400px; margin: 2em auto; background: #222; color: #fff; padding: 2em; border-radius: 10px; }
label { display: block; margin-top: 1em; }
input { width: 100%; padding: 0.5em; margin-top: 0.2em; border-radius: 5px; border: none; }
.btn { margin-top: 1em; width: 100%; }
.error { color: #ff5252; margin-bottom: 1em; }
</style>
