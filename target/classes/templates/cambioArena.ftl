<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
      Cambio Arena
    </title>
    <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
  </head>
  <body class="fondo-general">
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
      <div class="Cuadro">
        <p>
          ¿ESTÁ SEGURO DE QUE DESEA APLICAR LOS NUEVOS CAMBIOS?
        </p>
      </div>
      <div class="Confirmacion">
        <#if redirectTo??>
          <a href="/gestionUsuarios">
            <input type="button" value="SI" id="Si">
          </a>
          <a href="/gestionUsuarios">
            <input type="button" value="NO" id="No">
          </a>
        <#else>
          <a href="/listaTorneo">
            <input type="button" value="SI" id="Si">
          </a>
          <a href="/listaTorneo">
            <input type="button" value="NO" id="No">
          </a>
        </#if>
      </div>
      <hr class="Linea">
    </div>
    <div class="Botones">
      <button onclick="history.back()">
        <img src="/img/Volver.svg" alt="Volver">
      </button>
      <a href="/principal">
        <img src="/img/Casa.svg" alt="Inicio">
      </a>
      <a href="/clasificaciones">
        <img src="/img/Siguiente.svg" alt="Siguiente">
      </a>
    </div>
  </body>
</html>
