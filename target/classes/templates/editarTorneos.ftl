<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Creacion Torneos - Servidor</title>
    <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/estilosAgrupados.css">
</head>

<body class="EditarTorneos-css">
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
    </div>

    <div class="torneos">
        <h2>${torneo.nombre}</h2>
        <div class="torneo">
            <div class="info-princ">
                <img src="/img/${torneo.arenaImg}" class="info-img">
                <p>${torneo.arenaNombre}</p>
            </div>
            <div class="info-lateral">COPAs REQUERIDAS: ${torneo.copasMin} 🏆</div>
        </div>

        <div class="eligir"><h3>ELIGE ARENA:</h3></div>
        <div class="carrusel">
            <div class="contenido-carrusel">
                <#list arenas as arena>
                    <div class="carta">
                        <img src="/img/${arena.img}">
                        <p>${arena.nombre}</p>
                    </div>
                </#list>
            </div>
        </div>

        <div class="form">
            <form action="/guardarTorneo" method="POST">
                <label>JUGADORES:</label>
                <select name="maxJugadores">
                    <option value="8">8</option>
                </select>
                <div class="Confirmacion">
                    <input type="submit" value="GUARDAR" id="guardar">
                    <a href="/torneos"><input type="button" value="DESCARTAR" id="descartar"></a>
                </div>
            </form>
        </div>
    </div>

    <div class="Botones">
        <button onclick="history.back()"><img src="/img/Volver.svg"></button>
        <a href="/"><img src="/img/Casa.svg"></a>
        <a href="/clasificaciones"><img src="/img/Siguiente.svg"></a>
    </div>
</body>
</html>