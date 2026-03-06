<head>
    ...
    <link rel="stylesheet" type="text/css" href="/css/estilosAgrupados.css">
</head>

<body class="Principal-css">
    <div class="encavezado">
        <div class="boton-hamburguesa">
            <label for="desplegable" class="desplegable">
                <img src="/img/Barras.svg" alt="Menú">
            </label>
            ...
        </div>
        <h1> CLASH LEAGUE </h1>
        <img class="logo" src="/img/image_png.png" alt="Icono">
    </div>

    <div class="torneos">
        <#list torneos as t>
            <div class="participar">
                <form action="/participar/${t.id}" method="POST">
                    <div class="torneo">
                        <div class="info-princ">
                            <p class="titulo">${t.nombre}</p>
                            <img src="/img/arena${t.idArena}.png" class="info-img">
                        </div>
                    </div>
                    <button type="submit" class="btn">Participar</button>
                </form>
            </div>
        </#list>
    </div>
    ...
</body>