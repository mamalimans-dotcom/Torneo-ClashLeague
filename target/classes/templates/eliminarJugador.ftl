<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar Jugador - Servidor</title>
    <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/estilosAgrupados.css">
</head>

<body class="EliminarJugador-css">
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
    </div>

    <div class="Contenido">
        <div class="Cuadro">
            <p>¿ESTÁ SEGURO DE QUE DESEA ELIMINAR A <br> ${jugador.nombre}?</p>
        </div>

        <div class="Confirmacion">
            <form action="/eliminarDefinitivo" method="POST">
                <input type="hidden" name="id" value="${jugador.id}">
                <input type="submit" value="SI" id="Si">
            </form>
            <a href="/gestion"><input type="button" value="NO" id="No"></a>
        </div>
    </div>

    <div class="Botones">
        <a onclick="history.back()"><img src="/img/Volver.svg" alt="Volver"></a>
        <a href="/"><img src="/img/Casa.svg" alt="Inicio"></a>
    </div>
</body>
</html>