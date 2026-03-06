<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/estilosAgrupados.css">
    <title>Campo de Batalla</title>
</head>

<body class="CampoBatalla-css">
    <div class="encavezado">
        <div class="boton-hamburguesa" id="botonMenu">
            <input type="checkbox" id="desplegable">
            <label for="desplegable" class="desplegable">
                <img src="/img/Barras.svg">
            </label>

            <div class="Panel">
                <a href="GestionJugadores.html"><input class="opciones" type="button" value="GESTION DE JUGADORES"></a>
                <a href="ListaTorneos.html"><input class="opciones" type="button" value="LISTA DE TORNEOS"></a>
                <ol>
                    <a href="Clasificaciones.html"><input class="opciones" type="button" value="TORNEO 1"></a>
                    <a href="#"><input class="opciones" type="button" value="TORNEO 2"></a>
                    <a href="#"><input class="opciones" type="button" value="TORNEO 3"></a>
                </ol>
                <a href="Clasificaciones.html"><input class="opciones" type="button" value="CLASIFICACIONES"></a>
            </div>
        </div>
        <h1> CLASH LEAGUE </h1>
        <img class="logo" src="/img/image_png.png" alt="icono">
    </div>

    <div class="torneos">
        <div class="Batalla">
            <video class="video" autoplay muted loop>
                <source src="/img/VidBatalla.mp4" type="video/mp4">
            </video>
        </div>
    </div>

    <div class="Botones">
        <button onclick="history.back()"><img src="/img/Volver.svg"></button>
        <a href="Principal.html"><img src="/img/Casa.svg"></a>
        <a href="Clasificaciones.html"><img src="/img/Siguiente.svg"></a>
    </div>
</body>
</html>