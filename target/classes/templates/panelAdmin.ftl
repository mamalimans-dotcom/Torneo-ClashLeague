<body class="PanelAdmin-css">
     <div class="cabecera">
        <h1>CLASH LEAGUE</h1>
        <img src="/img/image_png.png" id="icono">
    </div>

    <input type="checkbox" id="desplegable">
    <label for="desplegable" class="desplegable">
        <img src="/img/Barras.svg">
    </label>

    <div class="Panel">
        <a href="/admin/jugadores"><button class="opciones">GESTIÓN DE JUGADORES</button></a>
        <a href="/admin/torneos"><button class="opciones">LISTA DE TORNEOS</button></a>

        <#if listaTorneos??>
            <#list listaTorneos as t>
                <a href="/torneo/${t.id}"><button class="opciones" id="torneos">${t.nombre}</button></a>
            </#list>
        </#if>

        <a href="/clasificaciones"><button class="opciones">CLASIFICACIONES</button></a>
    </div>

    <div class="Botones">
        <a onclick="history.back()"><img src="/img/Volver.svg"></a>
        <a href="/logout"><img src="/img/Casa.svg"></a>
        <a href="/clasificaciones"><img src="/img/Siguiente.svg"></a>
    </div>
</body>