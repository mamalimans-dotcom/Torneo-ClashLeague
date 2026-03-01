
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Edición de ${torneoActual.nombre}</title>
    <link rel="stylesheet" type="text/css" href="../css/CreacionTorneos.css">
</head>
<body>
    <div class="cabecera">
        <h1>CLASH LEAGUE</h1>
        <p>Editando Torneo ID: ${torneoActual.id}</p>
    </div>

    <div class="titulos">
        <h2 id="torneo1">${torneoActual.nombre?upper_case}</h2>
    </div>

    <div class="Panel">
        <ol>

            <#if torneos??>
                <#list torneos as t>
                    <a href="ver?id=${t.id}"><div class="opciones">${t.nombre}</div></a>
                </#list>
            </#if>
        </ol>
    </div>

    <div class="form">
        <form action="guardarTorneo" method="POST">
            <input type="hidden" name="id" value="${torneoActual.id}">
            <label>NOMBRE DEL TORNEO:</label>
            <input type="text" name="nombre" value="${torneoActual.nombre}">


            <div class="Confirmacion">
                <input type="submit" value="GUARDAR" id="guardar">
            </div>
        </form>
    </div>
</body>
</html>