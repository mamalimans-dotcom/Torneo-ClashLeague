<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Torneos - Clash League</title>
    <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>

<body class="fondo-esqueleto">
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
    <h2>Torneos Disponibles</h2>
    <#if torneos?? && torneos?size gt 0>
        <#list torneos as t>
        <div class="participar">
            <#-- Cambiado a /login por tu petición -->
            <form action="/jugadores" method="get">
            <input type="hidden" name="torneoId" value="${t.id}">
                <div class="torneo">
                    <div class="info-lateral izquierda">
                        <label class="icon-ver">
                            <input type="checkbox">
                            <i class="fa-solid fa-eye"></i>
                            <span>VER</span>
                        </label>
                        <div class="copas">
                            <span>${t.numeroCopas}</span>
                            <i class="fa-solid fa-trophy" style="color: gold;"></i>
                        </div>
                    </div>

                    <div class="info-princ">
                        <p class="titulo">${t.nombre}<br><span>1 x 1</span></p>
                        <#if t.id % 2 == 0>
                            <img src="/img/arena2.png" alt="arena" class="info-img">
                        <#else>
                            <img src="/img/arena1.png" alt="arena" class="info-img">
                        </#if>
                    </div>

                    <div class="info-lateral derecha">
                        <span>8 / 8</span>
                        <i class="fa-solid fa-people-group"></i>
                    </div>
                </div>
                <input type="submit" value="Participar" class="btn">
            </form>
        </div>
        </#list>

    <#else>

        <div class="participar">
            <form action="/login" method="get">
                <div class="torneo">
                    <div class="info-lateral izquierda">
                        <label class="icon-ver">
                            <input type="checkbox">
                            <i class="fa-solid fa-eye"></i>
                            <span>VER</span>
                        </label>
                        <div class="copas">
                            <span>5000</span>
                            <i class="fa-solid fa-trophy" style="color: gold;"></i>
                        </div>
                    </div>
                    <div class="info-princ">
                        <p class="titulo">TORNEO LEGENDARIO <br><span>1 x 1</span></p>
                        <img src="/img/arena1.png" alt="arena" class="info-img">
                    </div>
                    <div class="info-lateral derecha">
                        <span>8 / 8</span>
                        <i class="fa-solid fa-people-group"></i>
                    </div>
                </div>
                <input type="submit" value="Participar" class="btn">
            </form>
        </div>

        <div class="participar">
            <form action="/login" method="get">
                <div class="torneo">
                    <div class="info-lateral izquierda">
                        <label class="icon-ver">
                            <input type="checkbox">
                            <i class="fa-solid fa-eye"></i>
                            <span>VER</span>
                        </label>
                        <div class="copas">
                            <span>2500</span>
                            <i class="fa-solid fa-trophy" style="color: gold;"></i>
                        </div>
                    </div>
                    <div class="info-princ">
                        <p class="titulo">COPA PRINCIPIANTE <br><span>1 x 1</span></p>
                        <img src="/img/arena2.png" alt="arena" class="info-img">
                    </div>
                    <div class="info-lateral derecha">
                        <span>4 / 8</span>
                        <i class="fa-solid fa-people-group"></i>
                    </div>
                </div>
                <input type="submit" value="Participar" class="btn">
            </form>
        </div>

    </#if>
</div>

<div class="Botones">
    <a onclick="history.back()"><img src="/img/Volver.svg" alt="Volver"></a>
    <a href="/principal"><img src="/img/Casa.svg" alt="Inicio"></a>
    <a onclick="location.reload()"><img src="/img/Siguiente.svg" alt="Recargar"></a>
</div>
</body>
</html>