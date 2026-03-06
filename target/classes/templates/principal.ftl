<div class="torneos">
    <h2>Torneos</h2>
    <#if listaTorneos??>
        <#list listaTorneos as t>
            <div class="participar">
                <form action="/participar/${t.id}" method="POST">
                    <div class="torneo">
                        <div class="info-lateral izquierda">
                            <label class="icon-ver">
                                <input type="checkbox">
                                <i class="fa-solid fa-eye"></i>
                                <span>VER</span>
                            </label>
                            <div class="copas">
                                <span>${t.copasMinimas}</span>
                                <i class="fa-solid fa-trophy"></i>
                            </div>
                        </div>
                        <div class="info-princ">
                            <p class="titulo">${t.nombre}<br><span>1 x 1</span></p>
                            <img src="/img/arena${t.idArena}.png" class="info-img">
                        </div>
                        <div class="info-lateral derecha">
                            <span>${t.jugadoresInscritos} / ${t.capacidad}</span>
                            <i class="fa-solid fa-people-group"></i>
                        </div>
                    </div>
                    <button type="submit" class="btn">Participar</button>
                </form>
            </div>
        </#list>
    </#if>
</div>