package edu.masanz.da.crudj.controller;

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

        context.render("templates3/ListaTorneos.ftl", model);
    }


    public static void crearTorneo(@NotNull Context context) {
        String nombre = context.formParam("nombre");
        int numeroCopas = Integer.parseInt(Objects.requireNonNull(context.formParam("NumeroCopas")));

        int resultado = torneoService.crearTorneo(nombre, numeroCopas);

        if (resultado > 0) {
            context.redirect("/templates3/creacionTorneos.ftl");
        }else{
            System.out.println("Error al crear torneo");
        }
    }

    public static void servirLogin(Context ctx) {
        Map<String, Object> model = new HashMap<>();
        model.put("titulo", "Login - Clash League");

        ctx.render("templates3/login.ftl", model);
    }

    public static void login(Context ctx) {

        String email = ctx.formParam("email");
        String password = ctx.formParam("password");

        User user = userService.login(email, password);

        if (user == null) {
            Map<String, Object> model = new HashMap<>();
            model.put("titulo", "Login - Clash League");
            model.put("error", "Usuario o contraseña incorrectos");

            ctx.render("templates3/login.ftl", model);
        } else {
            ctx.sessionAttribute("email", user.getEmail());
            ctx.redirect("/principal");
        }
    }
    public static void before(@NotNull Context context) {
        if (context.path().equals("/")  ||
                context.path().equals("/login")  ||
                context.path().equals("/principal")  ||
                context.path().equals("/crearUsuario")  ||
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

        context.render("templates3/principal.ftl", model);
    }

    public static void cargarJugadores(@NotNull Context context){

        List<User> jugadores = TorneoController.userService.obtenerUsuarios();

        Map<String, Object> datos = new HashMap<>();
        datos.put("jugadores", jugadores);

        context.render("templates3/Jugadores.ftl", datos);
    }


    public static void cambioArena(@NotNull Context context){
        Map<String, Object> model = new HashMap<>();

        context.render("templates3/cambioArena.ftl", model);

    }

    public static void eliminarTorneo(@NotNull Context context) {
    }

    public static void eliminiarUsuario(@NotNull Context context) {

    }

    public static void gestionUsuarios(@NotNull Context context) {

    }


    public static void mostrarBuscarJugador(@NotNull Context context) {
        context.render("templates3/buscarJugador.ftl");
    }


    public static void cargarJugador(@NotNull Context context) {
            String idParam = context.queryParam("id");

            if (idParam == null || idParam.isEmpty()) {
                context.attribute("error", "Debes introducir un ID");
                context.render("templates3/buscarJugador.ftl");
                return;
            }

            int id = Integer.parseInt(idParam);

            User jugador = TorneoController.userService.obtenerUsuario(id);

            if (jugador == null) {
                context.attribute("error", "No existe un jugador con ID: " + id);
                context.render("templates3/buscarJugador.ftl");
                return;
            }

            Map<String, Object> datos = new HashMap<>();
            datos.put("jugador", jugador);
            context.render("templates3/editarJugador.ftl", datos);
    }


    public static void actualizarJugador(@NotNull Context context) {
        int id = Integer.parseInt(context.formParam("id"));
        String email = context.formParam("email");
        String password = context.formParam("contraseña");
        String rol = context.formParam("rol");
        String alias = context.formParam("alias");
        String nombre = context.formParam("nombre");
        int nivel = Integer.parseInt(context.formParam("nivel"));

        if (nivel < 1 || nivel > 100) {
            context.redirect("/creacionUsuarios?error=El+nivel+debe+ser+entre+1+y+100");
            return;
        }

        String copasStr = context.formParam("copas");
        copasStr = copasStr.replace(".", "");
        int copas = Integer.parseInt(copasStr);

        String clan = context.formParam("clan");
        String img = context.formParam("img");


        User jugadorActualizado = new User();
        jugadorActualizado.setId(id);
        jugadorActualizado.setEmail(email);
        jugadorActualizado.setPassword(password);
        jugadorActualizado.setRol(rol);
        jugadorActualizado.setAlias(alias);
        jugadorActualizado.setNombre(nombre);
        jugadorActualizado.setNivel(nivel);
        jugadorActualizado.setCopas(copas);
        jugadorActualizado.setClan(clan);
        jugadorActualizado.setImg(img);

        boolean actualizado = TorneoController.userService.actualizarUsuario(jugadorActualizado);

        if (actualizado) {
            System.out.println("Usuario actualizado");
        } else {
            System.out.println("El usuario no se ha podido actualizar");
        }

    }

    public static void crearUsuario(@NotNull Context context) {

        String nombre = context.formParam("nombre");
        String alias = context.formParam("alias");
        String email = context.formParam("email");
        String password = context.formParam("contraseña");
        String nivelStr = context.formParam("nivel");
        if (nivelStr == null || nivelStr.isEmpty()) {
            context.redirect("/crearUsuario?error=El+nivel+es+obligatorio");
            return;
        }
        int nivel = Integer.parseInt(nivelStr);

        String copasStr = context.formParam("copas");
        copasStr = copasStr.replace(".", "");
        int copas = Integer.parseInt(copasStr);
        String clan = context.formParam("clan");
        String rol = context.formParam("rol");
        String img = context.formParam("img");


        User user = new User();
        user.setEmail(email);
        user.setPassword(password);
        user.setRol(rol);
        user.setAlias(alias);
        user.setNombre(nombre);
        user.setNivel(nivel);
        user.setCopas(copas);
        user.setClan(clan);
        user.setImg(img);

        userService.crearUsuario(user.getEmail(),user.getPassword(),user.getRol(),user.getAlias(),user.getNombre(),user.getNivel(),user.getCopas(),user.getClan(),user.getImg());

        Map<String, Object> model = new HashMap<>();
        context.render("templates3/creacionUsuarios.ftl",model);
    }

}



