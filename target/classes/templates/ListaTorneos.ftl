<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com">

    <link rel="stylesheet" type="text/css" href="/css/ListaTorneos.css">
    <title>Lista de torneos</title>
</head>

<body>

    <div class="encavezado">
        <div class="boton-hamburguesa" id="botonMenu">
            <input type="checkbox" id="desplegable">
            <label for="desplegable" class="desplegable">
                <img src="/img/Barras.svg">
            </label>

            <div class="Panel">
                <a href="/jugadores"><input class="opciones" type="button" value="GESTION DE JUGADORES"></a>
                <a href="/"><input class="opciones" type="button" value="LISTA DE TORNEOS"></a>
                <ol>

                    <#list torneos as t>
                        <a href="#torneo-${t.id}"><input class="opciones" id="torneos" type="button" value="${t.nombre}"></a>
                    </#list>
                </ol>
                <a href="/clasificaciones"><input class="opciones" type="button" value="CLASIFICACIONES"></a>
            </div>
        </div>
        <h1> CLASH LEAGUE </h1>
        <img class="logo" src="/img/image_png.png" alt="icono">
    </div>


    <div class="listaTorneos">
        <h2>Lista de Torneos </h2>


        <#list torneos as t>
            <div class="torneos" id="torneo-${t.id}">
                <input type="checkbox" id="check-${t.id}" class="torneo-checkbox">
                <label for="check-${t.id}">
                    <p>${t.nombre}</p>
                    <div class="img">
                        <img src="/img/torneo1.png" alt="torneo" class="img-torneo">
                    </div>
                </label>
                <div class="boton">
                    <a href="/torneo/editar/${t.id}"><button class="btn"><i class="fa-solid fa-pen-to-square"></i>Editar</button></a>
                    <a href="/torneo/eliminar/${t.id}"><button class="btn"><i class="fa-solid fa-trash"></i>Eliminar</button></a>
                </div>
            </div>
        </#list>

        <a href="/torneo/nuevo"><input type="submit" value=" + Nuevo" class="btn"></a>

    </div>

    <div class="Botones">
        <a onclick="history.back()"><img src="/img/Volver.svg"></a>
        <a href="/"><img src="/img/Casa.svg"></a>
        <a onclick="history.forward()"><img src="/img/Siguiente.svg"></a>
    </div>
</body>
</html>
