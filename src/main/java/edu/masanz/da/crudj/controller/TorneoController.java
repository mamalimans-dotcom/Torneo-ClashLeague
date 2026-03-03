package edu.masanz.da.crudj.controller;

import edu.masanz.da.crudj.dto.Torneo;
import edu.masanz.da.crudj.dto.User;
import edu.masanz.da.crudj.service.TorneoService;
import edu.masanz.da.crudj.service.UserService;
import io.javalin.http.Context;
import org.jetbrains.annotations.NotNull;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TorneoController {

    private static UserService userService = new UserService();

    public static void cargarTorneos(@NotNull Context context) {
        List<Torneo> torneos = TorneoService.cargarTorneos();


        Map<String, Object> model = new HashMap<>();

        model.put("torneos", torneos);

        context.render("templates/ListaTorneos.ftl", model);
    }

    public static void crearTorneo(@NotNull Context context) {
    }

    public static void servirLogin(Context ctx) {
        Map<String, Object> model = new HashMap<>();
        model.put("titulo", "Login - Clash League");

        ctx.render("templates/login.ftl", model);
    }

    public static void login(Context ctx) {

        String email = ctx.formParam("email");
        String password = ctx.formParam("password");

        User user = userService.login(email, password);

        if (user == null) {
            // ERROR: usuario no existe
            Map<String, Object> model = new HashMap<>();
            model.put("titulo", "Login - Clash League");
            model.put("error", "Usuario o contraseña incorrectos");

            ctx.render("templates/login.ftl", model);
        } else {
            // LOGIN CORRECTO → ir a jugadores
            ctx.redirect("/jugadores");
        }
    }

    public static void Before(@NotNull Context context) {

        Object usuario = context.formParam("usuario");
        if (usuario == null) {
            context.render("/login");
        }
        // context.req().getSession().getId();

    }


    public static void after(@NotNull Context context) {
        System.out.println("finalizando");
    }

}
