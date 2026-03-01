 <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CLASH LEAGUE</title>
    <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/Login.css">
</head>

<body>
    <div class="login">
        <div class="form">
            <div class="titulo">
                <div class="text">
                    <h1>CLASH LEAGUE</h1>
                </div>
                <div class="img-icon">
                    <img src="/images/image_png.png" id="icono" alt="Icono">
                </div>
            </div>

            <#--  Formulario de login - ahora envía a /login  -->
            <form action="/login" method="post">
                <label class="log">EMAIL</label>
                <input type="email" name="email" id="email" value="${email!''}" required>

                <label class="log">CONTRASEÑA</label>
                <input type="password" name="password" id="password" required>

                <#--  Mensaje de error si existe  -->
                <#if error??>
                    <div class="error-mensaje" style="color: red; margin: 10px 0;">
                        ${error}
                    </div>
                </#if>

                <a href="/registro-admin">
                    <button class="administrador" type="button">
                        Registrarse como administrador
                    </button>
                </a>

                <br><br>

                <input class="submit" type="submit" value="Login">
            </form>
        </div>
    </div>

    <div class="Botones">
        <a href="/"><img src="/images/Casa.svg" alt="Inicio"></a>
    </div>
</body>

</html>