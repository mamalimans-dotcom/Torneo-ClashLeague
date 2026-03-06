<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CreacionTorneos - Servidor</title>
    <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/estilosAgrupados.css">
</head>
<body class="CreacionTorneos-css">
    <div class="cabecera">
        <h1>CLASH LEAGUE</h1>
        <img src="/img/image_png.png" id="icono">
    </div>

    <div class="titulos">
        <h2 id="torneo1">TORNEO 1</h2>
        <h2 id="Nuvtorneo">NUEVO TORNEO</h2>
        <h3 id="Arena">ELIGUE ARENA:</h3>
    </div>

    <input type="checkbox" id="desplegable">
    <label for="desplegable" class="desplegable">
        <img src="/img/Barras.svg" alt="Menú">
    </label>
    <div class="Panel">
        <a href="/gestion"><div class="opciones">GESTIÓN DE JUGADORES</div></a>
        <a href="/torneos"><div class="opciones">LISTA DE TORNEOS</div></a>
        <ol>
        <#if torneos??>
            <#list torneos as t>
                <a href="#"><div class="opciones">${t.nombre}</div></a>
            </#list>
        </#if>
        </ol>
        <a href="/clasificaciones"><div class="opciones">CLASIFICACIONES</div></a>
    </div>

    <div class="carrusel">
        <div class="contenido-carrusel">
            <div class="carta">
                <img src="/img/arena5.webp" alt="arena 5">
                <p>ARENA 5</p>
            </div>
            <div class="carta">
                <img src="/img/Arena7.webp" alt="arena 7">
                <p>ARENA 7</p>
            </div>
            <div class="carta">
                <img src="/img/Arena9.webp" alt="arena 9">
                <p>ARENA 9</p>
            </div>
        </div>
    </div>

    <div class="form">
        <form action="/guardarTorneo" method="POST">
            <label>CANTIDAD DE JUGADORES:</label>
            <select name="cantidad">
                <#list [4, 8] as n>
                    <option value="${n}">${n}</option>
                </#list>
            </select>
            <label>COPAS MINIMAS:</label>
            <select name="copas">
                <#list [1000, 2000, 3000, 4000, 5000] as copas>
                    <option value="${copas}">${copas}</option>
                </#list>
            </select>
            <div class="Confirmacion">
               <input type="submit" value="GUARDAR" id="guardar">
               <a href="/torneos"><input type="button" value="DESCARTAR" id="descartar"></a>
            </div>
        </form>
    </div>

    <div class="Botones">
        <a onclick="history.back()"><img src="/img/Volver.svg" alt="Volver"></a>
        <a href="/"><img src="/img/Casa.svg" alt="Inicio"></a>
        <a href="/clasificaciones"><img src="/img/Siguiente.svg" alt="Siguiente"></a>
    </div>
</body>
</html>