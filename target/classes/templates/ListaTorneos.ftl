<body class="ListaTorneos-css">
    <div class="listaTorneos">
        <h2>Lista de Torneos</h2>

        <#list torneos as t>
            <div class="torneos" id="torneo-${t.id}">
                <p>${t.nombre}</p>
                <div class="img">
                    <img src="/img/torneo1.png" alt="Imagen Torneo" class="img-torneo">
                </div>
                <div class="boton">
                    <a href="/torneo/editar/${t.id}"><button class="btn"><i class="fa-solid fa-pen-to-square"></i> Editar</button></a>
                    <a href="/torneo/eliminar/${t.id}"><button class="btn"><i class="fa-solid fa-trash"></i> Eliminar</button></a>
                </div>
            </div>
        </#list>

        <a href="/torneo/nuevo"><button class="btn btn-nuevo"> + Nuevo Torneo</button></a>
    </div>

    </body>