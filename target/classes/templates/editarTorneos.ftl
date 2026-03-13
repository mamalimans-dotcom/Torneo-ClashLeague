<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
      Editar Torneo - Clash League
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
      <h2>
        ${torneo.nombre!"TORNEO"}
      </h2>
      <div class="torneo-form">
        <div class="info-princ">
          <img src="/img/${torneo.arena}.webp" alt="Arena">
          <div class="titulo">
            ESTADO:
            <span style="color: #28a745;">
              ACTIVO
            </span>
          </div>
        </div>
        <div class="info-lateral">
          NÚMERO DE COPAS: ${torneo.numeroCopas!0} 🏆
        </div>
        <div class="info-lateral">
          PARTICIPANTES: 8 / 8 👥
        </div>
      </div>
      <div class="form-ju">
        <form action="/actualizarTorneo" method="post">
          <input type="hidden" name="id" value="${torneo.id}" class="usuario1">
          <label>
            NOMBRE TORNEO:
          </label>
          <input type="text" name="nombre" class="usuario1">
          <br>
          <br>
          <div class="eligir">
            <h3>
              ELEGIR ARENA
            </h3>
          </div>
          <div class="carrusel">
            <div class="contenido-carrusel">
              <label class="carta">
                <input type="radio" name="arena" value="arena5"
                            <#if (torneo.arena)! == "arena5">
                checked
              </#if>
              >
              <img src="/img/arena5.webp" alt="arena 5">
              <p>
                ARENA 5
              </p>
            </label>
            <label class="carta">
              <input type="radio" name="arena" value="arena7"
                            <#if (torneo.arena)! == "arena7">
              checked
            </#if>
            >
            <img src="/img/arena7.webp" alt="arena 7">
            <p>
              ARENA 7
            </p>
          </label>
          <label class="carta">
            <input type="radio" name="arena" value="arena9"
                            <#if (torneo.arena)! == "arena9">
            checked
          </#if>
          >
          <img src="/img/arena9.webp" alt="arena 9">
          <p>
            ARENA 9
          </p>
        </label>
      </div>
    </div>
    <label>
      CANTIDAD DE JUGADORES:
    </label>
    <select name="cantidadJugadores">
      <option value="4" <#if torneo.numJugadores == 4>
        selected
      </#if>
      >4
    </option>
    <option value="8" <#if torneo.numJugadores == 8>
      selected
    </#if>
    >8
  </option>
</select>
<label>
  COPAS MÍNIMAS:
</label>
<select name="numeroCopas">
  <#list [1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000] as c>
    <option value="${c}" <#if torneo.numeroCopas == c>
      selected
    </#if>
    >${c}
  </option>
</#list>
</select>
<div class="Confirmacion">
  <input type="submit" value="GUARDAR" id="guardar">
  <a href="/listaTorneo">
    <input type="button" value="DESCARTAR" id="descartar">
  </a>
</div>
</form>
</div>
</div>
<div class="Botones">
  <button onclick="history.back()">
    <img src="/img/Volver.svg" alt="Volver">
  </button>
  <a href="/principal">
    <img src="/img/Casa.svg" alt="Inicio">
  </a>
  <a href="/listaTorneo">
    <img src="/img/Siguiente.svg" alt="Siguiente">
  </a>
</div>
</body>
</html>
