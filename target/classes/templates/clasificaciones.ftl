<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clasificación - Clash League</title>
    <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>

<body class="fondo-general">
<div class="encavezado">
    <div class="boton-hamburguesa" id="botonMenu">
        <input type="checkbox" id="desplegable">
        <label for="desplegable" class="desplegable">
            <img src="/img/Barras.svg" alt="Menu">
        </label>
        <div class="Panel">

          <#if user??>
                <a href="/logout"><div class="opciones">CERRAR SESIÓN</div></a>
            <#else>
                <a href="/principal"><div class="opciones">VOLVER AL INICIO</div></a>
            </#if>
        </div>
    </div>
    <h1> CLASH LEAGUE </h1>
    <img class="logo" src="/img/image_png.png" alt="icono">
</div>

<div class="contenedor">
    <h2>CLASIFICACIONES</h2>
    <div class="ronda">
        <div class="ronda-titulo">RONDA 1</div>
        <div class="secciones">
            <div class="grupos">
                <div class="grupo">${jugador1!"JUGADOR 1"}</div>
                <div class="grupo">${jugador2!"JUGADOR 2"}</div>
            </div>
            <div class="ganador">${ganadorR1!"GANADOR"}</div>
        </div>
    </div>


    <div class="ronda">
        <div class="ronda-titulo">FINAL</div>
        <div class="secciones">
            <div class="grupos">
                <div class="grupo">${finalista1!"FINALISTA 1"}</div>
                <div class="grupo">${finalista2!"FINALISTA 2"}</div>
            </div>
            <div class="ganador" style="border-color: gold; color: gold;">🏆 ${campeon!"CAMPEÓN"}</div>
        </div>
    </div>
</div>

<div class="Botones">
    <button onclick="history.back()"><img src="/img/Volver.svg" alt="Volver"></button>
    <a href="/principal"><img src="/img/Casa.svg" alt="Inicio"></a>
    <a href="/campoBatalla"><img src="/img/Siguiente.svg" alt="Siguiente"></a>
</div>
</body>
</html>