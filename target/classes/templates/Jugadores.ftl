<body class="Jugadores-css">
    <div class="enfrentamientos">
        <h2>JUGADORES <span>TORNEO 1</span></h2>

        <#if jugadores?has_content>
            <#list jugadores?chunk(2) as pareja>
                <div class="duelo">
                    <#-- Jugador 1 (Izquierda) -->
                    <div class="jugador">
                        <#if pareja[0]??>
                            <img src="/img/emblema${pareja[0].idEmblema}.png" class="icono">
                            <p>${pareja[0].alias}<br>
                                <span class="info">${pareja[0].clan}<br>RANKED #${pareja[0].nivel}</span>
                            </p>
                        </#if>
                    </div>

                    <div class="vs-container">
                        <img src="/img/espaditas.png" class="vs-img">
                    </div>

                    <#-- Jugador 2 (Derecha) -->
                    <div class="jugador derecha">
                        <#if pareja[1]??>
                            <img src="/img/emblema${pareja[1].idEmblema}.png" class="icono">
                            <p>${pareja[1].alias}<br>
                                <span class="info">${pareja[1].clan}<br>RANKED #${pareja[1].nivel}</span>
                            </p>
                        </#if>
                    </div>
                </div>
            </#list>
        </#if>

        <a href="/batalla" class="btn">LISTO</a>
    </div>

    </body>