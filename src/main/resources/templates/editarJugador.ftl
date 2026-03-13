<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <title>Editar Jugador - Clash League</title>
</head>

<body class="fondo-general">
<div class="encavezado">
    <div class="boton-hamburguesa" id="botonMenu">
        <input type="checkbox" id="desplegable">
        <label for="desplegable" class="desplegable">
            <img src="/img/Barras.svg" alt="Menú">
        </label>
        <div class="Panel">
            <#if sessionUser??>
                <a href="/logout"><input class="opciones" type="button" value="CERRAR SESIÓN"></a>
            </#if>
        </div>
    </div>
    <h1> CLASH LEAGUE </h1>
    <img class="logo" src="/img/image_png.png" alt="icono">
</div>

<div class="contenedor">
    <h2 class="titulo-editar">EDITAR JUGADOR</h2>


    <form action="/confirmarGuardarJugador" method="post" class="form-ju">

        <input type="hidden" name="id" value="${user.id}">

        <label>NOMBRE:</label>
        <input type="text" name="nombre" class="usuario1" value="${user.nombre!''}">

        <label>ALIAS:</label>
        <input type="text" name="alias" class="usuario1" value="${user.alias!''}" required>

        <label>EMAIL:</label>
        <input type="email" name="email" class="usuario1" value="${user.email!''}" required>

        <label>CONTRASEÑA:</label><br>
        <input type="password" name="contraseña" class="usuario1" value="${user.password!''}"><br><br>

        <label>NIVEL:</label>
        <input type="number" name="nivel" class="usuario1" value="${user.nivel!1}">

        <label>COPAS:</label>
        <select name="copas">
            <#list [1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000] as c>
                <option value="${c}" <#if user.copas == c>selected</#if>>${c}</option>
            </#list>
        </select>

        <label>CLAN:</label>
        <input type="text" name="clan" class="usuario1" value="${user.clan!''}">

        <label>ROL:</label>
        <select name="rol" style="width: 100%;">
            <option value="USUARIO" <#if user.rol == "USUARIO">selected</#if>>USUARIO</option>
            <option value="ADMIN" <#if user.rol == "ADMIN">selected</#if>>ADMIN</option>
            <option value="MODERADOR" <#if user.rol == "MODERADOR">selected</#if>>MODERADOR</option>
        </select>

        <label>IMAGEN:</label>
            <select name="img" style="width: 100%;">
            <#list ["emblema1", "emblema2", "emblema3", "emblema4", "emblema5", "emblema6", "emblema7", "emblema8"] as i>
                <option value="${i}" <#if user.img == i>selected</#if>>${i}</option>
            </#list>
            </select>

        <div class="Confirmacion">
            <input type="submit" value="GUARDAR" id="guardar">
            <a href="/gestionUsuarios"><input type="button" value="DESCARTAR" id="descartar"></a>
        </div>
    </form>
</div>

<div class="Botones">
    <button onclick="history.back()"><img src="/img/Volver.svg" alt="Volver"></button>
    <a href="/principal"><img src="/img/Casa.svg" alt="Inicio"></a>
    <a href="/gestionUsuarios"><img src="/img/Siguiente.svg" alt="Siguiente"></a>
</div>
</body>
</html>