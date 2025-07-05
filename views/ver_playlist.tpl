<!DOCTYPE html>
<html>
<head>
    <title>Playlist: {{playlist.nome}}</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            background: linear-gradient(to top, #000000, #1a1a1a);
            color: white;
            height: 100vh;
        }

        {* container principal *}
        .container {
            padding: 30px 60px;
            text-align: center;
        }

        {* botão voltar *}
        .btn-voltar {
            position: absolute;
            top: 20px;
            left: 20px;
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

        .btn-voltar img {
            height: 25px;
            width: 35px;
            margin-right: 3px;
        }

        {* título e botão lápis *}
        .titulo-area {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 15px;
            margin-bottom: 30px;
        }

        .titulo-area h2 {
            margin: 0;
        }

        .btn-editar {
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

        .btn-editar img {
            height: 18px;
        }

        {* grid de músicas *}
        .grid-musicas {
            display: grid;
            grid-template-columns: repeat(6, 1fr);  
            gap: 20px;
            margin-top: 20px;
            max-width: 1400px;  
            margin-left: auto;
            margin-right: auto;
        }
        .capa-musica {
            position: relative;
            border-radius: 12px;
            overflow: hidden;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .capa-musica img {
            width: 100%;
            display: block;
        }

        .hover-overlay {
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background-color: rgba(102, 47, 47, 0.05);
            opacity: 0;
            transition: opacity 0.3s ease;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .capa-musica:hover .hover-overlay {
            opacity: 1;
        }
        .capa-musica:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .play-btn {
            background-color: #8a2be2;
            border: none;
            border-radius: 50%;
            width: 45px;
            height: 45px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .play-btn img {
            width: 25px;
            height: 25px;
            margin-left: 3px;
        }

        .info-musica {
            text-align: center;
            margin-top: 8px;
        }

        .titulo {
            font-weight: bold;
            font-size: 14px;
        }

        .autor {
            font-size: 12px;
            color: #ccc;
        }

        {* modal de edição *}
        .modal {
            display: none;
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background-color: rgba(0,0,0,0.6);
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        .modal-content {
            background-color: #2e2e2e;
            padding: 30px;
            border-radius: 15px;
            text-align: center;
            width: 300px;
        }

        .modal-content h3 {
            margin-top: 0;
        }

        .modal-content a {
            display: block;
            margin: 15px 0;
            color: #8a2be2;
            text-decoration: none;
        }

        .modal-content a:hover {
            text-decoration: underline;
        }
    </style>
    <script>
        function abrirModal() {
            document.getElementById('popup-edicao').style.display = 'flex';
        }
        function fecharModal() {
            document.getElementById('popup-edicao').style.display = 'none';
        }
        window.onclick = function(event) {
            const modal = document.getElementById('popup-edicao');
            if (event.target === modal) {
                fecharModal();
            }
        }
    </script>
</head>
<body>
    <a href="/playlists" class="btn-voltar" title="Voltar">
        <img src="/static/img/return-arrow.png" alt="Voltar">
    </a>

    <div class="container">
        <div class="titulo-area">
            <h2>Playlist: {{playlist.nome}}</h2>
            <button class="btn-editar" onclick="abrirModal()" title="Editar">
                <img src="/static/img/lapis.png" alt="Editar">
            </button>
        </div>

        % if itens:
        <div class="grid-musicas">
            % for item in itens:
                % if item['tipo'] == 'musica':
                <div class="capa-musica">
                    <img src="/static/img/capaID{{item['obj'].id}}.png" alt="Capa da música">
                    <div class="hover-overlay">
                        <a href="/musicas/{{item['obj'].id}}" class="play-btn">
                            <img src="/static/img/play-button-arrowhead.png" alt="Play">
                        </a>
                    </div>
                    <div class="info-musica">
                        <div class="titulo">{{item['obj'].titulo}}</div>
                        <div class="autor">{{item['obj'].artista}}</div>
                    </div>
                </div>
                % end
            % end
        </div>
        % else:
            <p>Esta playlist não possui itens.</p>
        % end
    </div>

    <!-- Modal popup -->
    <div id="popup-edicao" class="modal">
        <div class="modal-content">
            <h3>Editar Playlist</h3>
            <a href="/playlists/{{playlist.id}}/adicionar">Adicionar Música ou Podcast</a>
            <a href="#" onclick="fecharModal()">Remover Música ou Podcast</a>
        </div>
    </div>
</body>
</html>
