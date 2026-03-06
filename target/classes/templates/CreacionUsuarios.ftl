<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Creacion Usuarios - Servidor</title>
    <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/estilosAgrupados.css">
</head>
<body class="CreacionUsuarios-css">
    <div class="cabecera">
        <h1>CLASH LEAGUE</h1>
        <img src="/img/image_png.png" id="icono">
    </div>

    <input type="checkbox" id="desplegable">
    <label for="desplegable" class="desplegable">
        <img src="/img/Barras.svg" alt="Menú">
    </label>
    <div class="Panel">
        <a href="/gestion"><div class="opciones">GESTIÓN DE JUGADORES</div></a>
        <a href="/torneos"><div class="opciones">LISTA DE TORNEOS</div></a>
        <a href="/clasificaciones"><div class="opciones">CLASIFICACIONES</div></a>
        <ol>
            <#if torneos??>
                <#list torneos as t>
                    <a href="#"><div class="opciones">${t.nombre}</div></a>
                </#list>
            </#if>
        </ol>
    </div>

    <div class="form-container">
        <div class="form">
            <form action="/crearUsuario" method="POST">
                <label for="nombre" class="nombre">NOMBRE USUARIO:</label>
                <input type="text" name="username" class="submit-input" id="nombre" required>

                <label for="contraseña" class="nombre">CONTRASEÑA:</label>
                <input type="password" name="password" class="submit-input" id="contraseña" required>

                <input type="submit" id="boton" value="SIGUIENTE">
            </form>
        </div>
    </div>

    <div class="Botones">
        <a href="/clasificaciones"><img src="/img/Volver.svg" alt="Volver"></a>
        <a href="/"><img src="/img/Casa.svg" alt="Inicio"></a>
        <a href="/clasificaciones"><img src="/img/Siguiente.svg" alt="Siguiente"></a>
    </div>
</body>
</html>