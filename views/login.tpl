<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        .auth-container {
          max-width: 400px;
          margin: 3em auto;
          background: #181818;
          color: #fff;
          padding: 2.5em 2em 2em 2em;
          border-radius: 16px;
          box-shadow: 0 4px 24px rgba(0,0,0,0.18);
          display: flex;
          flex-direction: column;
          align-items: center;
        }
        .auth-container h2 {
          margin-bottom: 1.5em;
          font-weight: 600;
          letter-spacing: 1px;
        }
        label {
          display: block;
          margin-top: 1em;
          margin-bottom: 0.3em;
          font-size: 1.05em;
          color: #b3b3b3;
        }
        input {
          width: 100%;
          padding: 0.7em;
          margin-bottom: 0.7em;
          border-radius: 6px;
          border: 1px solid #333;
          background: #222;
          color: #fff;
          font-size: 1em;
          transition: border 0.2s;
        }
        input:focus {
          border: 1.5px solid #1db954;
          outline: none;
        }
        .btn {
          margin-top: 1em;
          width: 100%;
          padding: 0.7em;
          background: linear-gradient(90deg, #1db954 60%, #1ed760 100%);
          color: #fff;
          border: none;
          border-radius: 6px;
          font-weight: bold;
          font-size: 1.1em;
          cursor: pointer;
          transition: background 0.2s;
        }
        .btn:hover {
          background: linear-gradient(90deg, #1ed760 60%, #1db954 100%);
        }
        .error {
          color: #ff5252;
          margin-bottom: 1em;
          width: 100%;
          text-align: center;
          font-weight: 500;
          background: #2c0000;
          border-radius: 5px;
          padding: 0.5em 0;
        }
        .auth-container p {
          margin-top: 1.5em;
          color: #b3b3b3;
          font-size: 0.98em;
        }
        .auth-container a {
          color: #1db954;
          text-decoration: none;
          font-weight: 500;
        }
        .auth-container a:hover {
          text-decoration: underline;
        }
    </style>
</head>
<body>
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
</body>
</html>
