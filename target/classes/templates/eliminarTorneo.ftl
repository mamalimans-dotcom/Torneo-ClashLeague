<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar Torneo - Clash League</title>
    <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>

<body class="fondo-general">
<div class="encavezado">
    <div class="boton-hamburguesa">
        <input type="checkbox" id="desplegable">
        <label for="desplegable" class="desplegable">
            <img src="/img/Barras.svg" alt="Menú">
        </label>
        <div class="Panel">
            <#if user?? && (user.rol?lower_case == "admin" || user.rol?lower_case == "moderador")>
                <a href="/gestionUsuarios"><input class="opciones" type="button" value="GESTIÓN DE JUGADORES"></a>
                <a href="/listaTorneo"><input class="opciones" type="button" value="LISTA DE TORNEOS"></a>
                <a href="/clasificaciones"><input class="opciones" type="button" value="CLASIFICACIONES"></a>
            </#if>

            <#if user??>
                <a href="/logout"><input class="opciones" type="button" value="CERRAR SESIÓN"></a>
            <#else>
                <a href="/login"><input class="opciones" type="button" value="INICIAR SESIÓN"></a>
            </#if>
        </div>
    </div>
    <h1>CLASH LEAGUE</h1>
    <img class="logo" src="/img/image_png.png" alt="Logo">
</div>
<div class="contenedor">
    <div class="Cuadro">
        <p>¿ESTÁ SEGURO DE QUE DESEA ELIMINAR EL TORNEO: <br>
           <span style="color: #dc3545; text-transform: uppercase;">${torneo.nombre!"SIN NOMBRE"}</span>?</p>
    </div>

    <div class="Confirmacion">
        <form action="/eliminarTorneo/${torneo.id}" method="post">
            <input type="hidden" name="id" value="${torneo.id}">
            <input type="submit" value="SI" id="Si">
        </form>
        <a href="/listaTorneo"><input type="button" value="NO" id="No"></a>
    </div>
</div>

<div class="Botones">
    <button onclick="history.back()"><img src="/img/Volver.svg" alt="Volver"></button>
    <a href="/principal"><img src="/img/Casa.svg" alt="Inicio"></a>
    <a href="/listaTorneo"><img src="/img/Siguiente.svg" alt="Siguiente"></a>
</div>
</body>
</html>