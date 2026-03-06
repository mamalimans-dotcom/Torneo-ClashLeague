<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/estilosAgrupados.css">
    <title>Clasificación - Torneo</title>
</head>
<body class="Clasificaciones-css">
    <div class="encavezado">
        <div class="boton-hamburguesa">
            <input type="checkbox" id="desplegable">
            <label for="desplegable" class="desplegable">
                <img src="/img/Barras.svg">
            </label>
            <div class="Panel">
                <a href="ListaTorneos.html"><input class="opciones" type="button" value="LISTA DE TORNEOS"></a>
                <a href="GestionJugadores.html"><input class="opciones" type="button" value="GESTIÓN DE JUGADORES"></a>
                <ol>
                    <a href="#"><input class="opciones" type="button" value="TORNEO 1"></a>
                    <a href="#"><input class="opciones" type="button" value="TORNEO 2"></a>
                    <a href="#"><input class="opciones" type="button" value="TORNEO 3"></a>
                </ol>
            </div>
        </div>
        <h1> CLASH LEAGUE </h1>
        <img class="logo" src="/img/image_png.png" alt="icono">
    </div>

    <div class="clasificaciones">
        <h2>CLASIFICACIONES<br><br><span>TORNEO 1</span></h2>

        <div class="ronda">
            <div class="ronda-titulo">RONDA 1</div>
            <div class="secciones">
                <div class="grupos">
                    <div class="grupo">jugador 1</div>
                    <div class="grupo">jugador 2</div>
                </div>
                <div class="ganador">jugador 2</div>
            </div>
            <div class="secciones">
                <div class="grupos">
                    <div class="grupo">jugador 3</div>
                    <div class="grupo">jugador 4</div>
                </div>
                <div class="ganador">jugador 4</div>
            </div>
            <div class="secciones">
                <div class="grupos">
                    <div class="grupo">jugador 5</div>
                    <div class="grupo">jugador 6</div>
                </div>
                <div class="ganador">jugador 5</div>
            </div>
            <div class="secciones">
                <div class="grupos">
                    <div class="grupo">jugador 7</div>
                    <div class="grupo">jugador 8</div>
                </div>
                <div class="ganador">jugador 8</div>
            </div>
        </div>

        <div class="ronda">
            <div class="ronda-titulo">RONDA 2</div>
            <div class="secciones">
                <div class="grupos">
                    <div class="grupo">jugador 2</div>
                    <div class="grupo">jugador 4</div>
                </div>
                <div class="ganador">jugador 4</div>
            </div>
            <div class="secciones">
                <div class="grupos">
                    <div class="grupo">jugador 5</div>
                    <div class="grupo">jugador 8</div>
                </div>
                <div class="ganador">jugador 8</div>
            </div>
        </div>

        <div class="ronda">
            <div class="ronda-titulo">FINAL</div>
            <div class="secciones">
                <div class="grupos">
                    <div class="grupo">jugador 8</div>
                    <div class="grupo">jugador 4</div>
                </div>
                <div class="ganador">jugador 4</div>
            </div>
        </div>

        <div class="ronda">
            <div class="ronda-titulo">GANADOR</div>
            <div class="campeon">🏆 JUGADOR 4</div>
        </div>
    </div>

    <div class="Botones">
        <button onclick="history.back()"><img src="/img/Volver.svg" alt="Volver"></button>
        <a href="Principal.html"><img src="/img/Casa.svg" alt="Inicio"></a>
        <a href="CampoBatalla.html"><img src="/img/Siguiente.svg" alt="Siguiente"></a>
    </div>
</body>
</html>