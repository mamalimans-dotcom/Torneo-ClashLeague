<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - CLASH LEAGUE</title>
    <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/estilosAgrupados.css">
</head>

<body class="Login-css">
<div class="login">
    <div class="form">
        <div class="titulo">
            <div class="text">
                <h1>CLASH LEAGUE</h1>
            </div>
            <div class="img-icon">
                <img src="/img/image_png.png" id="icono" alt="Icono">
            </div>
        </div>

        <form action="/login" method="post">
            <label>EMAIL</label>
            <input type="email" id="email" name="email" placeholder="ejemplo@correo.com" required>

            <label>CONTRASEÑA</label>
            <input type="password" id="password" name="password" placeholder="******" required>

            <input class="submit" type="submit" value="Entrar">
            <#if error??>
                <p style="color: #ff4d6d; text-align: center; margin-top: 10px;">${error}</p>
            </#if>
            <a href="PanelAdmin.html" style="text-decoration: none;">
                <button class="administrador" type="button">
                    Registrarse como administrador
                </button>
            </a>
        </form>
    </div>
</div>

<div class="Botones">
    <a href="Principal.html"><img src="/img/Casa.svg" alt="Inicio"></a>
</div>
</body>
</html>