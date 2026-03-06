<body class="Login-css">
<div class="login">
    <div class="form">
        <div class="titulo">
            <div class="text">
                <h1>CLASH LEAGUE</h1>
            </div>
            <div class="img-icon">
                <img src="/img/image_png.png" id="icono">
            </div>
        </div>

        <form action="/login" method="post">
            <label>EMAIL</label>
            <input type="email" name="email" required>

            <label>CONTRASEÑA</label>
            <input type="password" name="password" required>

            <#if error??>
                <p style="color: #ff4d6d; text-align: center; margin-top: 10px;">${error}</p>
            </#if>

            <button class="submit" type="submit">LOGIN</button>
        </form>

        <a href="/admin/registro" style="text-decoration: none;">
            <button type="button" class="administrador">
                IR A ADMIN / REGISTRO
            </button>
        </a>
    </div>
</div>

<div class="Botones">
    <a href="/">
        <img src="/img/Casa.svg">
    </a>
</div>
</body>