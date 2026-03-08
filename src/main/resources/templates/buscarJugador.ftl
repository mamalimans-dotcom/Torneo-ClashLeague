<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/estilosAgrupados.css">
    <title>Buscar Jugador</title>
</head>

<body class="EditarJugador-css">
    <div class="encavezado">
        <div class="boton-hamburguesa" id="botonMenu">
            <input type="checkbox" id="desplegable">
            <label for="desplegable" class="desplegable">
                <img src="/img/Barras.svg">
            </label>
            <div class="Panel">
                <a href="/gestion"><div class="opciones">GESTIÓN DE JUGADORES</div></a>
                <a href="/torneos"><div class="opciones">LISTA DE TORNEOS</div></a>
                <a href="/clasificaciones"><div class="opciones">CLASIFICACIONES</div></a>
            </div>
        </div>
        <h1> CLASH LEAGUE </h1>
        <img class="logo" src="/img/image_png.png" alt="icono">
    </div>

    <div class="contenedor">
        <h2>MODIFICAR JUGADOR<br><span>Introduce el ID del jugador</span></h2>

        <#if error??>
            <div class="error-mensaje" style="color: red; text-align: center; margin: 10px;">
                ${error}
            </div>
        </#if>

        <div class="form">
            <form action="/cargarJugador" method="GET">
                <label>ID DEL JUGADOR:</label><br>
                <input type="number" name="id" class="usuario1" placeholder="Ej: 1" required><br><br>

                <div class="Confirmacion">
                    <input type="submit" value="BUSCAR JUGADOR" id="guardar">
                    <a href="/gestion"><input type="button" value="CANCELAR" id="descartar"></a>
                </div>
            </form>
        </div>
    </div>

    <div class="Botones">
        <a href="/gestion"><img src="/img/Volver.svg" alt="Volver"></a>
        <a href="/"><img src="/img/Casa.svg" alt="Inicio"></a>
        <a href="#"><img src="/img/Siguiente.svg" alt="Siguiente"></a>
    </div>
</body>
</html>