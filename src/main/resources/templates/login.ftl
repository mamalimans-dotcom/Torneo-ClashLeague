<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Clash League</title>
    <link rel="stylesheet" href="/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
</head>
<body class="fondo-esqueleto">

    <div class="contenedor">
        <div class="titulo-login">
            <h1>CLASH LEAGUE</h1>
            <img src="/img/image_png.png" id="icono-login" alt="Icono">
        </div>

        <form action="/login" method="post" class="form-login">
            <label for="email">CORREO ELECTRÓNICO</label>
            <input type="email" id="email" name="email" placeholder="ejemplo@email.com" required>

            <label for="password">CONTRASEÑA</label>
            <input type="password" id="password" name="password" placeholder="********" required>

            <#if error??>
                <div class="error-glow" style="color: #ff4d6d; text-align: center; margin-bottom: 15px; font-weight: bold; text-transform: uppercase;">
                    ${error}
                </div>
            </#if>

            <input type="submit" value="ENTRAR" class="submit">
        </form>
    </div>
</body>
</html>