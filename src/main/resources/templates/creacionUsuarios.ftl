<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <title>Editar Jugador - Servidor</title>
</head>

<body class="fondo-general">
    <div class="encavezado">
        <div class="boton-hamburguesa" id="botonMenu">
            <input type="checkbox" id="desplegable">
            <label for="desplegable" class="desplegable">
                <img src="/img/Barras.svg">
            </label>
            <div class="Panel">
                    <a href="/logout"><div class="opciones">CERRAR SESIÓN</div></a>
            </div>
        </div>
        <h1> CLASH LEAGUE </h1>
        <img class="logo" src="/img/image_png.png" alt="icono">
    </div>

    <div class="contenedor">
        <h2>Crear Jugador<br><span>Información de Jugador</span></h2>
        <div class="form-ju">
            <form action="/crearJugador" method="POST">
                <input type="hidden" name="torneoId" value="${torneoId!}">

                <label>NOMBRE:</label><br>
                <input type="text" name="nombre" class="usuario1"><br><br>

                <label>ALIAS:</label><br>
                <input type="text" name="alias" class="usuario1"><br><br>

                <label>EMAIL:</label><br>
                <input type="email" name="email" class="usuario1"><br><br>

                <label>CONTRASEÑA:</label><br>
                <input type="password" name="contraseña" class="usuario1"><br><br>

                <label>NIVEL:</label>
                <input type="number" name="nivel" class="usuario2" min="1" max="100" value="1">

                <label>COPAS:</label>
                <select name="copas">
                    <option value="1000">1000</option>
                         <option value="2000">2000</option>
                         <option value="3000">3000</option>
                         <option value="4000">4000</option>
                         <option value="5000">5000</option>
                         <option value="6000">6000</option>
                         <option value="7000">7000</option>
                         <option value="8000">8000</option>
                         <option value="9000">9000</option>
                         <option value="10.000">10.000</option>
                </select><br><br>

                <label>CLAN:</label><br>
                <input type="text" name="clan" class="usuario1"><br><br>

                <label>ROL:</label>
                <select name="rol" style="width: 100%;">
                    <option value="USUARIO">usuario</option>
                    <option value="ADMIN">admin</option>
                    <option value="MODERADOR">moderador</option>
                </select>

                <label>IMAGEN:</label>
                <select name="img" style="width: 100%;">
                    <option value="emblema1">emblema1</option>
                    <option value="emblema2">emblema2</option>
                    <option value="emblema3">emblema3</option>
                    <option value="emblema4">emblema4</option>
                    <option value="emblema5">emblema5</option>
                    <option value="emblema6">emblema6</option>
                    <option value="emblema7">emblema7</option>
                    <option value="emblema8">emblema8</option>
                </select>


                <div class="Confirmacion">
                    <a href="/gestionUsuarios"><input type="submit" value="GUARDAR" id="guardar">
                    <a href="/gestionUsuarios"><input type="button" value="DESCARTAR" id="descartar"></a>
                </div>
            </form>
        </div>
    </div>

    <div class="Botones">
        <a href="/gestionUsuarios"><img src="/img/Volver.svg"></a>
        <a href="/"><img src="/img/Casa.svg"></a>
        <a href="#"><img src="/img/Siguiente.svg"></a>
    </div>
</body>
</html>