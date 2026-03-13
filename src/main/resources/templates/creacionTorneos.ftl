<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
      Creación de Torneo - Clash League
    </title>
    <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/style.css">
  </head>
  <body class="fondo-general" >
    <div class="encavezado">
      <div class="boton-hamburguesa">
        <input type="checkbox" id="desplegable">
        <label for="desplegable" class="desplegable">
          <img src="/img/Barras.svg" alt="Menú">
        </label>
        <div class="Panel">
          <#if user??>
            <a href="/logout">
              <input class="opciones" type="button" value="CERRAR SESIÓN">
            </a>
          <#else>
            <a href="/login">
              <input class="opciones" type="button" value="INICIAR SESIÓN">
            </a>
          </#if>
        </div>
      </div>
      <h1>
        CLASH LEAGUE
      </h1>
      <img class="logo" src="/img/image_png.png" alt="Logo">
    </div>
    <div class="contenedor">
      <h2 class="h2">
        NUEVO TORNEO
      </h2>
      <div class="form-ju">
        <form action="/guardarTorneo" method="post">
          <label>
            Nombre del torneo
          </label>
          <input type="text" name="nombre" required class="usuario1">
          <h3 class="tituloArena">
            ELIGE ARENA
          </h3>
          <div class="carrusel">
          <div class="contenido-carrusel">
            <label class="carta">
              <input type="radio" name="arena" value="ARENA 5" required>
              <img src="/img/arena5.webp">
              <p>
                Arena 5
              </p>
            </label>
            <label class="carta">
              <input type="radio" name="arena" value="ARENA 7">
              <img src="/img/arena7.webp">
              <p>
                Arena 7
              </p>
            </label>
            <label class="carta">
              <input type="radio" name="arena" value="ARENA 9">
              <img src="/img/arena9.webp">
              <p>
                Arena 9
              </p>
            </label>
            </div>
          </div>
          <label>
            Cantidad de jugadores
          </label>
          <select name="cantidadJugadores">
            <option value="4" >
              4
            </option>
            <option value="8">
              8
            </option>
          </select>
          <label>
            Copas mínimas
          </label>
          <select name="numeroCopas">
            <#list [1000,2000,3000,4000,5000,6000,7000,8000,9000,10000] as c>
              <option value="${c}">
                ${c}
              </option>
            </#list>
          </select>
          <div class="Confirmacion">
            <a href="/gestionUsuarios">
              <input type="submit" value="GUARDAR" id="guardar">
              <a href="/gestionUsuarios">
                <input type="button" value="DESCARTAR" id="descartar">
              </a>
            </div>
          </form>
        </div>
      </div>
      <div class="Botones">
        <button onclick="history.back()">
          <img src="/img/Volver.svg">
        </button>
        <a href="/principal">
          <img src="/img/Casa.svg">
        </a>
        <a href="/listaTorneo">
          <img src="/img/Siguiente.svg">
        </a>
      </div>
    </body>
  </html>
