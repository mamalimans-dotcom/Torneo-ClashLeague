<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/estilosAgrupados.css">
    <title>Editar Jugador - Servidor</title>
</head>

<body class="EditarJugador-css">
    <div class="encavezado">
        <div class="boton-hamburguesa" id="botonMenu">
            <input type="checkbox" id="desplegable">
            <label for="desplegable" class="desplegable">
                <img src="/img/Barras.svg">
            </label>
            <div class="Panel">
                <a href="/gestion"><div class="opciones">GESTIÓN DE JUGADORES</div></a>
                <a href="/torneos"><div class="opciones">LISTA DE TORNEOS</div></a>
                <a href="/clasificaciones"><div class="opciones">CLASIFICACIONES</div></a>
            </div>
        </div>
        <h1> CLASH LEAGUE </h1>
        <img class="logo" src="/img/image_png.png" alt="icono">
    </div>

    <div class="contenedor">
        <h2>Modificar Jugador<br><span>Información de Jugador</span></h2>
        <div class="form">
            <form action="/actualizarJugador" method="POST">
                <label>ID:</label><br>
                <input type="number" name="id" class="usuario1" value="${jugador.id!0}" readonly><br><br>

                <label>NOMBRE:</label><br>
                <input type="text" name="nombre" class="usuario1" value="${jugador.nombre!''}"><br><br>

                <label>ALIAS:</label><br>
                <input type="text" name="alias" class="usuario1" value="${jugador.alias!''}"><br><br>

                <label>NIVEL:</label>
                <input type="number" name="nivel" class="usuario2" value="${jugador.nivel!''}" min="1" max="100">

                <label>COPAS:</label>
                <select name="copas">
                    <#list [1000, 2000, 3000, 4000, 5000] as c>
                        <option value="${c}" <#if jugador.copas == c>selected</#if>>${c}</option>
                    </#list>
                </select><br><br>

                <label>CLAN:</label><br>
                <input type="text" name="clan" class="usuario1" value="${jugador.clan!''}"><br><br>

                <label>ROL:</label>
                <select name="rol" style="width: 100%;">
                    <option value="USUARIO">usuario</option>
                    <option value="ADMIN">admin</option>
                    <option value="MODERADOR">moderador</option>
                </select>

                <input type="hidden" name="email" value="${jugador.email!''}">
                <input type="hidden" name="password" value="${jugador.password!''}">

                <input type="hidden" name="img" value="${jugador.img!''}">

                <div class="Confirmacion">
                    <input type="submit" value="GUARDAR" id="guardar">
                    <a href="/gestion"><input type="button" value="DESCARTAR" id="descartar"></a>
                </div>
            </form>
        </div>
    </div>

    <div class="Botones">
        <a href="/gestion"><img src="/img/Volver.svg"></a>
        <a href="/"><img src="/img/Casa.svg"></a>
        <a href="#"><img src="/img/Siguiente.svg"></a>
    </div>
</body>
</html>