<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <title>Campo de Batalla</title>
</head>

<body class="fondo-general">
<div class="encavezado">
    <div class="boton-hamburguesa" id="botonMenu">
        <input type="checkbox" id="desplegable">
        <label for="desplegable" class="desplegable">
            <img src="/img/Barras.svg">
        </label>

        <div class="Panel">

            <#if user?? && (user.rol?lower_case == "admin" || user.rol?lower_case == "moderador")>
                <a href="/gestionUsuarios"><input class="opciones" type="button" value="GESTIÓN DE JUGADORES"></a>
                <a href="/listaTorneo"><input class="opciones" type="button" value="LISTA DE TORNEOS"></a>
                <a href="/clasificaciones"><input class="opciones" type="button" value="CLASIFICACIONES"></a>
            </#if>


            <#if user??>
                <a href="/logout"><input class="opciones" type="button" value="CERRAR SESIÓN"></a>
            </#if>
        </div>
    </div>
    <h1> CLASH LEAGUE </h1>
    <img class="logo" src="/img/image_png.png" alt="icono">
</div>

<div class="contenedor">
    <div class="Batalla">
        <video class="video" autoplay muted loop>
            <source src="/img/VidBatalla.mp4" type="video/mp4">
        </video>
    </div>
</div>

<div class="Botones">
    <button onclick="history.back()"><img src="/img/Volver.svg" alt="Volver"></button>
    <a href="/principal"><img src="/img/Casa.svg" alt="Inicio"></a>
    <a href="/clasificaciones"><img src="/img/Siguiente.svg" alt="Siguiente"></a>
</div>

</body>
</html>