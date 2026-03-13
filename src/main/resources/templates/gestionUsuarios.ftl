<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Jugadores - Clash League</title>
    <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>

<body class="fondo-general">

<div class="encavezado">
    <div class="boton-hamburguesa" id="botonMenu">
        <input type="checkbox" id="desplegable">
        <label for="desplegable" class="desplegable">
            <img src="/img/Barras.svg" alt="Menú">
        </label>

        <div class="Panel">

                <a href="/listaTorneo"><div class="opciones">LISTA DE TORNEOS</div></a>
                <a href="/logout"><div class="opciones">CERRAR SESIÓN</div></a>


        </div>
    </div>
    <h1> CLASH LEAGUE </h1>
    <img class="logo" src="/img/image_png.png" alt="icono">
</div>

<div class="contenedor">
    <h2>Gestión Jugadores</h2>
    <#list torneos as t>
    <div class="acordeon">
        <input type="checkbox" id="jugadores${t.id}" class="acordeon-checkbox">
        <label for="jugadores${t.id}" class="jugadores-ges">
            <div class="torneo-ges">
                <p>${t.nombre} <i class="fa-solid fa-chevron-down" style="font-size: 15px; margin-left: 10px;"></i></p>
            </div>
        </label>

        <div class="tabla-jugadores">
            <table>
                <thead>
                <tr>
                    <th>Alias</th>
                    <th>Nombre</th>
                    <th>Copas</th>
                    <th>Edición</th>
                    <th>Eliminar</th>
                </tr>
                </thead>
                <tbody>

                <#list t.usuarios as u>
                <tr>
                    <td>${u.alias}</td>
                    <td>${u.nombre}</td>
                    <td>${u.copas} 🏆</td>
                    <td><a href="/editarJugador/${u.id}"><i class="fa-solid fa-pen-to-square"></i></a></td>
                    <td><a href="/eliminarJugador/${u.id}"><i class="fa-solid fa-trash"></i></a></td>
                </tr>
                </#list>
                </tbody>
            </table>

            <div class="acciones-tabla">
                <a href="/crearJugador?torneoId=${t.id}" class="btn">+ Nuevo Jugador</a>
            </div>
        </div>
    </div>
    </#list>
</div>

<div class="Botones">
    <button onclick="history.back()"><img src="/img/Volver.svg" alt="Volver"></button>
    <a href="/principal"><img src="/img/Casa.svg" alt="Inicio"></a>
    <a href="/listaTorneo"><img src="/img/Siguiente.svg" alt="Siguiente"></a>
</div>

</body>
</html>