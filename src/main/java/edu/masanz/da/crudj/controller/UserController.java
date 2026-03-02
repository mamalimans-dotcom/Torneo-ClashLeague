package edu.masanz.da.crudj.controller;

import edu.masanz.da.crudj.dto.User;
import edu.masanz.da.crudj.service.UserService;
import io.javalin.http.Context;

import java.util.HashMap;
import java.util.Map;

public class UserController {

    private static UserService userService = new UserService();

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
}