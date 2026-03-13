<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <title>Jugadores - Torneo ${torneo.nombre!''}</title>
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
        <h2>JUGADORES DEL TORNEO <span>${torneo.nombre!''}</span></h2>
        <#if jugadores?has_content>
            <#list jugadores?chunk(2) as pareja>
                <div class="duelo">


                    <div class="jugador">
                        <#if pareja[0]??>
                            <img src="/img/${pareja[0].img!''}.png" class="icono" onerror="this.src='/img/emblema1.png'">
                            <p>${pareja[0].alias!''}<br>
                                <span class="info">${pareja[0].clan!''}<br>RANKED #${pareja[0].nivel!''}</span>
                            </p>
                        <#else>
                            <img src="/img/emblema1.png" class="icono">
                            <p>Esperando<br><span class="info">oponente</span></p>
                        </#if>
                    </div>

                    <div class="vs-container">
                        <img src="/img/espaditas.png" class="vs-img">
                    </div>


                    <div class="jugador derecha">
                        <#if pareja[1]??>
                            <img src="/img/${pareja[1].img!''}.png" class="icono" onerror="this.src='/img/emblema1.png'">
                            <p>${pareja[1].alias!''}<br>
                                <span class="info">${pareja[1].clan!''}<br>RANKED #${pareja[1].nivel!''}</span>
                            </p>
                        <#else>
                            <p>Esperando<br><span class="info">oponente</span></p>
                        </#if>
                    </div>
                </div>
            </#list>
        <#else>
            <p style="text-align: center; color: white; margin-top: 50px;">
                No hay jugadores en este torneo
            </p>
        </#if>

             <a href="/campoBatalla?torneoId=${torneo.id}" class="btn">LISTO</a>

    </div>

    <div class="Botones">
        <button onclick="history.back()"><img src="/img/Volver.svg" alt="Volver"></button>
        <a href="/principal"><img src="/img/Casa.svg" alt="Inicio"></a>
        <a href="/campoBatalla?torneoId=${torneo.id}"><img src="/img/Siguiente.svg" alt="Siguiente"></a>
    </div>
</body>
</html>