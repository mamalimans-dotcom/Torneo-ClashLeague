package edu.masanz.da.crudj.controller;

import edu.masanz.da.crudj.database.ConnectionManager;
import edu.masanz.da.crudj.dto.Torneo;
import edu.masanz.da.crudj.dto.User;
import edu.masanz.da.crudj.service.TorneoService;
import edu.masanz.da.crudj.service.UserService;
import freemarker.template.Template;
import freemarker.template.Configuration;
import freemarker.template.TemplateException;
import io.javalin.http.Context;
import org.jetbrains.annotations.NotNull;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class TorneoController {

    private static UserService userService = new UserService();
    private static TorneoService torneoService = new TorneoService();

    public static void cargarTorneos(@NotNull Context context) {
        List<Torneo> torneos = TorneoService.cargarTorneos();


        Map<String, Object> model = new HashMap<>();

        model.put("torneos", torneos);

        context.render("templates/ListaTorneos.ftl", model);
    }

    public static void crearTorneo(@NotNull Context context) {
        String nombre = context.formParam("nombre");
        int numeroCopas = Integer.parseInt(Objects.requireNonNull(context.formParam("NumeroCopas")));

        int resultado = torneoService.crearTorneo(nombre, numeroCopas);

        if (resultado > 0) {
            context.redirect("/templates/creacionTorneos.ftl");
        }else{
            System.out.println("Error al crear torneo");
        }
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
            ctx.sessionAttribute("email", user.getEmail());
            // LOGIN CORRECTO → ir a principal
            ctx.redirect("/principal");
        }
    }

    public static void before(@NotNull Context context) {

        if (context.path().equals("/")  ||
                context.path().equals("/login")  ||
                context.path().equals("/principal")  ||
                context.path().startsWith("/img/")  ||
                context.path().startsWith("/css/")
        ){
            return;
        }

        String email = context.sessionAttribute("email");
        if (email == null){
            context.redirect("/login");
        }
    }


    public static void after(@NotNull Context context) {
        System.out.println("finalizando");
    }

    public static void servirPrincipal(@NotNull Context context) {
        context.render("/templates/principal.ftl");
    }

    public static void cargarJugadores(@NotNull Context context){ //Para el ftl de jugadores

        List<User> jugadores = userService.obtenerUsuarios();

        Map<String, Object> datos = new HashMap<>();
        datos.put("jugadores", jugadores);

        context.render("templates/Jugadores.ftl", datos);

    }



}
