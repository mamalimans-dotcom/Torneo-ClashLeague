package edu.masanz.da.crudj.controller;

import edu.masanz.da.crudj.dto.Torneo;
import edu.masanz.da.crudj.service.TorneoService;
import io.javalin.http.Context;
import org.jetbrains.annotations.NotNull;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TorneoController {

    public static void cargarTorneos(@NotNull Context context) {
        List<Torneo> lista = TorneoService.cargarTorneos();


        Map<String, Object> model = new HashMap<>();

        model.put("torneos", lista);

        context.render("templates/ListaTorneos.ftl", model);
    }



    public static void crearTorneo(@NotNull Context context) {
    }
}
