<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CambioArena</title>
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
        <a href="GestionJugadores.html"><div class="opciones">GESTIÓN DE JUGADORES</div></a>
        <a href="ListaTorneos.html"><div class="opciones">LISTA DE TORNEOS</div></a>
       <ol>
        <a href="#"><div class="opciones">TORNEO 1</div></a>
        <a href="#"><div class="opciones">TORNEO 2</div></a>
        <a href="#"><div class="opciones">TORNEO 3</div></a>
        </ol>
        <a href="Clasificaciones.html"><div class="opciones">CLASIFICACIONES</div></a>

    </div>

<div class="Contenido">
    <div class="Cuadro">
        <p>¿ESTA SEGURO DE QUE DESEA APLICAR LOS NUEVOS CAMBIOS?</p>
        <br>
    </div>

    <div class="Confirmacion">
        <a href="ListaTorneos.html"><input type="submit" value="SI" id="Si"></a>
        <a href="CreacionTorneos.html"><input type="submit" value="NO" id="No"></a>

    </div>

    <hr class="Linea">
</div>
     <div class="Botones">
        <button onclick="history.back()"><img src="../../../../../doc/gui/Volver.svg" alt="Volver"></button>
        <a href="Login.html"><img src="../../../../../doc/gui/Casa.svg" alt="Inicio"></a>
        <a href="Clasificaciones.html"><img src="../../../../../doc/gui/Siguiente.svg" alt="Siguiente"></a>
    </div>
</body>
</html>