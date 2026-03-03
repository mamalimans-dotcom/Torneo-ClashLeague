<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CreacionTorneos</title>
    <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/CreacionTorneos.css">
</head>

<body>
    <div class="cabecera">
        <h1>CLASH LEAGUE</h1>
        <img src="../../../../../doc/gui/image_png.png" id="icono">
    </div>

    <div class="titulos">
    <h2 id="torneo1">TORNEO 1</h2>
    <h2 id="Nuvtorneo">NUEVO TORNEO</h2>
    <h3 id="Arena">ELIGUE ARENA:</h3>
    </div>

    <input type="checkbox" id="desplegable">
    <label for="desplegable" class="desplegable">
        <img src="../../../../../doc/gui/Barras.svg" alt="Menú">
    </label>
    <div class="Panel">
        <a href="#"><div class="opciones">GESTIÓN DE JUGADORES</div></a>
        <a href="#"><div class="opciones">LISTA DE TORNEOS</div></a>
        <ol>
        <#if torneos??>
            <#list torneos as t>
                <a href="#"><div class="opciones">${t.nombre}</div></a>
            </#list>
        </#if>
        </ol>
        <a href="Clasificaciones.html"><div class="opciones">CLASIFICACIONES</div></a>

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
        <form>
            <label >CANTIDAD DE JUGADORES:</label>
            <select>
            <#list 1..8 as n>
                <option value="${n}">${n}</option>
            </list>
            </select>

             <label for="nombre" id="nombre" >COPAS MINIMAS:</label>
                <select>
                    <option value=""></option>
                  <#list [1000,2000,3000,4000,5000,6000,7000,8000,9000,10.000] as copas>
                    <option value="${copas}">${copas}</option>
                  </#list>

                </select>


            <div class="Confirmacion">
               <input type="submit" value="GUARDAR" id="guardar" formaction="CambioArena.html"></a>
                <input type="submit" value="DESCARTAR" id="descartar" formaction="ListaTorneos.html">
            </div>
        </form>

    </div>

     <div class="Botones">
        <a onclick="history.back()"><img src="../../../../../doc/gui/Volver.svg" alt="Volver"></a>
        <a href="Login.html"><img src="../../../../../doc/gui/Casa.svg" alt="Inicio"></a>
        <a href="Clasificaciones.html"><img src="../../../../../doc/gui/Siguiente.svg" alt="Siguiente"></a>
    </div>
</body>
</html>