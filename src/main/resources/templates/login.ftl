<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${titulo!"Login"}</title>
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
                <img src="/img/image_png.png" id="icono">
            </div>
        </div>

        <form action="/login" method="post">
            <label>EMAIL</label>
            <input type="email" name="email" required>

            <label>CONTRASEÑA</label>
            <input type="password" name="password" required>

            <br><br>

            <button class="submit" type="submit">Login</button>
        </form>

        <#if error??>
            <p style="color:red">${error}</p>
        </#if>

        <br>

        <a href="/admin">
            <button type="button" class="administrador">
                Ir a Admin
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

</html>