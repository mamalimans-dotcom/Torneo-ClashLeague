package edu.masanz.da.crudj.controller;

import edu.masanz.da.crudj.dao.TorneoDao;
import edu.masanz.da.crudj.dto.Torneo;
import edu.masanz.da.crudj.dto.User;
import edu.masanz.da.crudj.service.TorneoService;
import edu.masanz.da.crudj.service.UserService;
import io.javalin.http.Context;
import org.jetbrains.annotations.NotNull;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

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
        Map<String, Object> model = new HashMap<>();

        List<Torneo> lista = TorneoDao.cargarTorneos();
        model.put("torneos", lista);

        context.render("templates/principal.ftl", model);
    }

    public static void cargarJugadores(@NotNull Context context){

        List<User> jugadores = TorneoController.userService.obtenerUsuarios();  

        Map<String, Object> datos = new HashMap<>();
        datos.put("jugadores", jugadores);

        context.render("templates/Jugadores.ftl", datos);

    }


    public static void cambioArena(@NotNull Context context){
        Map<String, Object> model = new HashMap<>();

        context.render("templates/cambioArena.ftl", model);

    }

    public static void eliminarTorneo(@NotNull Context context) {
    }

    public static void eliminiarUsuario(@NotNull Context context) {

    }

    public static void gestionUsuarios(@NotNull Context context) {

    }
}



