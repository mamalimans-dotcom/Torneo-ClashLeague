<body class="GestionJugadores-css">
    <div class="encavezado">
        </div>

    <div class="torneos-jugadores">
        <h2>Gestion Jugadores</h2>

        <#list torneos as torneo>
        <input type="checkbox" id="jugadores${torneo.id}" class="torneo-checkbox">
        <label for="jugadores${torneo.id}" class="jugadores">
            <div class="torneo"><p>${torneo.nombre}</p></div>
        </label>
        <div class="tabla-jugadores" id="tabla${torneo.id}">
            <table>
                <tr>
                    <th>Nombres</th>
                    <th>ID</th>
                    <th>Copas</th>
                    <th>Edicion</th>
                    <th>Eliminar</th>
                </tr>
                <#list torneo.jugadores as jugador>
                <tr>
                    <td>${jugador.nombre}</td>
                    <td>${jugador.tag}</td>
                    <td>${jugador.copas}</td>
                    <td><a href="/editarJugador?id=${jugador.id}"><i class="fa-solid fa-pen-to-square"></i></a></td>
                    <td><a href="/eliminarJugador?id=${jugador.id}"><i class="fa-solid fa-trash"></i></a></td>
                </tr>
                </#list>
            </table>
            <form action="/crearJugador" method="GET">
                <input type="hidden" name="torneoId" value="${torneo.id}">
                <input type="submit" value=" + Nuevo Jugador" class="btn">
            </form>
        </div>
        </#list>
    </div>

    </body>