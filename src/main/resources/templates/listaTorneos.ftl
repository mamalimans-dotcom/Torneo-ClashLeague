<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Torneos - Clash League</title>
    <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>

<body class="fondo-espada">
<div class="encavezado">
    <div class="boton-hamburguesa">
        <input type="checkbox" id="desplegable">
        <label for="desplegable" class="desplegable">
            <img src="/img/Barras.svg" alt="Menú">
        </label>
        <div class="Panel">

                <a href="/gestionUsuarios"><div class="opciones">GESTIÓN DE JUGADORES</div></a>
                <a href="/logout"><div class="opciones">CERRAR SESIÓN</div></a>

        </div>
    </div>
    <h1> CLASH LEAGUE </h1>
    <img class="logo" src="/img/image_png.png" alt="Logo">
</div>

<div class="contenedor">
    <h2>Lista de Torneos</h2>

    <#if torneos?? && torneos?size gt 0>
        <#list torneos as t>
        <div class="torneos-card">
            <p>${t.nombre}</p>

            <img src="/img/torneo${(t.id % 2) + 1}.png" alt="${t.nombre}" class="img-torneo">

            <div class="boton-container">
                <a href="/editarTorneo/${t.id}">
                    <button class="submit"><i class="fa-solid fa-pen-to-square"></i> Editar</button>
                </a>
                <a href="/eliminarTorneo/${t.id}">
                    <button class="submit"><i class="fa-solid fa-trash"></i> Eliminar</button>
                </a>
            </div>
        </div>
        </#list>
    <#else>
        <p style="text-align: center; margin-top: 50px;">No hay torneos creados actualmente.</p>
    </#if>

    <div style="text-align: center; margin-top: 30px;">
        <a href="/crearTorneo" class="btn-nuevo">+ NUEVO TORNEO</a>
    </div>
</div>

<div class="Botones">
    <button onclick="history.back()"><img src="/img/Volver.svg" alt="Volver"></button>
    <a href="/principal"><img src="/img/Casa.svg" alt="Inicio"></a>
    <a href="/listaTorneo"><img src="/img/Siguiente.svg" alt="Siguiente"></a>
</div>
</body>
</html>