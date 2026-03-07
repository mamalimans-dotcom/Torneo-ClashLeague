<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <link rel="stylesheet" type="text/css" href="/css/estilosAgrupados.css">

    <title>Jugadores</title>
</head>
<body class="Jugadores-css">
    <div class="enfrentamientos">
        <h2>JUGADORES <span>TORNEO 1</span></h2>

        <#if jugadores?has_content>
            <#list jugadores?chunk(2) as pareja>
                <div class="duelo">
                    <#-- Jugador 1 (Izquierda) -->
                    <div class="jugador">
                        <#if pareja[0]??>
                            <img src="/img/${pareja[0].img!''}.png" class="icono" onerror="this.src='/img/emblema1.png'">
                            <p>${pareja[0].alias!''}<br>
                                <span class="info">${pareja[0].clan!''}<br>RANKED #${pareja[0].nivel!''}</span>
                            </p>
                        </#if>
                    </div>

                    <div class="vs-container">
                        <img src="/img/espaditas.png" class="vs-img">
                    </div>

                    <#-- Jugador 2 (Derecha) -->
                    <div class="jugador derecha">
                        <#if pareja[1]??>
                            <img src="/img/&{pareja[1].img!''}.png" class="icono" onerror="this.src='/img/emblema1.png'">
                            <p>${pareja[1].alias!''}<br>
                                <span class="info">${pareja[1].clan!''}<br>RANKED #${pareja[1].nivel!''}</span>
                            </p>
                        </#if>
                    </div>
                </div>
            </#list>
        </#if>

        <a href="/principal" class="btn">LISTO</a>
    </div>

    </body>
    </html>