<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CreacioUsuarios</title>
     <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/CambioArena.css">
</head>
<body>
    <div class="cabecera">
        <h1>CLASH LEAGUE</h1>
        <img src="../../../../../doc/gui/image_png.png" id="icono">
    </div>

    <input type="checkbox" id="desplegable">
    <label for="desplegable" class="desplegable">
        <img src="../../../../../doc/gui/Barras.svg" alt="Menú">
    </label>
    <div class="Panel">
        <a href="#"><div class="opciones">GESTIÓN DE JUGADORES</div></a>
        <a href="#"><div class="opciones">LISTA DE TORNEOS</div></a>
        <a href="Clasificaciones.html"><div class="opciones">CLASIFICACIONES</div></a>
       <ol>
        <a href="#"><div class="opciones">TORNEO 1</div></a>
        <a href="#"><div class="opciones">TORNEO 2</div></a>
        <a href="#"><div class="opciones">TORNEO 3</div></a>
        </ol>
    </div>

    <div class="form-container">
        <div class="form">
            <form>
                <label for="nombre" class="nombre">NOMBRE USUARIO:</label>
                <input type="text" class="submit" id="nombre">

                <label for="contraseña" class="nombre">CONTRASEÑA:</label>
                <input type="password" class="submit" id="contraseña">

                <input type="submit" id="boton" value="SIGUIENTE" formaction="EditarJugador.html">
            </form>
        </div>
    </div>

    <div class="Botones">
        <a href="Clasificaciones.html"><img src="../../../../../doc/gui/Volver.svg" alt="Volver"></a>
        <a href="Login.html"><img src="../../../../../doc/gui/Casa.svg" alt="Inicio"></a>
        <a href="Clasificaciones.html"><img src="../../../../../doc/gui/Siguiente.svg" alt="Siguiente"></a>
    </div>
</body>
</html>
