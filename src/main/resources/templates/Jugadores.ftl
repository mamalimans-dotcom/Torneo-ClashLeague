<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="../css/Jugadores.css">
    <title>Jugadores</title>
</head>


<body>
    <div class="encavezado">
        <div class="boton-hamburguesa" id="botonMenu">
            <input type="checkbox" id="desplegable">
            <label for="desplegable" class="desplegable">
                <img src="img/Barras.svg">
            </label>


            <div class="Panel">
                <a href=""><input class="opciones" type="submit" value="GESTION DE JUGADORES"></a>
                <a href=""><input class="opciones" type="submit" value="LISTA DE TORNEOS"></a>
                <a href=""><input class="opciones" type="submit" value="CLASIFICACIONES"></a>

                <ol>
                    <a href="../Torneo_ClashLeague/src/main/resources/public/html/Clasificaciones.html"><input class="opciones" id="torneos" type="submit" value="TORNEO 1"></a>
                    <a href=""><input class="opciones" id="torneos" type="submit" value="TORNEO 1"></a>
                    <a href=""><input class="opciones" id="torneos" type="submit" value="TORNEO 1"></a>
                </ol>
            </div>
        </div>

        <h1> CLASH LEAGUE </h1>
        <img class="logo" src="img/image_png.png" alt="icono">
    </div>


    <div class="enfrentamientos">
                            <h2>JUGADORES
                                <span>TORNEO 1</span>
                            </h2>

                                <#if jugadores?has_content>
                                    <#list jugadores?chunk(2) as pareja>
                                        <div class="duelo">
                                        <#-- Jugador izquierda -->
                                            <div class="jugador">
                                            <#if pareja[0]??>
                                            <img src="img/emblema1.png" class="icono">
                                            <p>${pareja[0].alias}<br>
                                                 <span class="info">${pareja[0].nombre}<br>RANKED # ${pareja[0].nivel}</span>
                                                 </p>
                                                 </#if>
                                            </div>
                                        <#-- Jugador izquierda -->


                                        <#-- Imagen -->
                                            <div class="vs-container">
                                            <img src="img/espaditas.png" class="vs-img">
                                            </div>
                                        <#-- Imagen -->


                                        <#-- Jugador derecha -->
                                            <div class="jugador derecha">
                                            <#if pareja[1]??>
                                            <img src="img/emblema2.png" class="icono">
                                                <p>${pareja[1].alias}<br>
                                                   <span class="info">${pareja[1].nombre}<br>RANKED # ${pareja[1].nivel}</span>
                                                   </p>
                                                </#if>
                                            </div>
                                        </div>
                                        <#-- Jugador derecha -->
                                    </#list>
                                    </#if>
                                </div>

        <a href="/principal" class="btn">LISTO</a>

    </div>
    <div class="Botones">
        <a href="Login.html"><img src="img/Volver.svg"></a>
        <a href="Principal.html"><img src="img/Casa.svg"></a>
        <a href="Principal.html"><img src="img/Siguiente.svg"></a>
    </div>
</body>

</html>