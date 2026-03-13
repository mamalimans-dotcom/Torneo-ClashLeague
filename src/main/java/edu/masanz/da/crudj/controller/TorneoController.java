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
    private static TorneoService torneoService = new TorneoService();

    public static void before(@NotNull Context context) {
        String path = context.path();
        if (path.equals("/") || path.equals("/login") || path.equals("/principal") ||
                path.equals("/loginAdminDirecto") ||
                path.equals("/panelAdmin") ||
                path.startsWith("/img/") || path.startsWith("/css/")) {
            return;
        }
        if (context.sessionAttribute("user") == null) {
            context.redirect("/login");
        }
    }


    public static void loginAdminDirecto(@NotNull Context context) {

        User admin = userService.login("jugador3@email.com", "password123");

        if (admin != null) {

            context.sessionAttribute("user", admin);
            context.redirect("/principal");
        } else {

            context.redirect("/login?error=true");
        }
    }


    public static void servirPrincipal(@NotNull Context context) {
        Map<String, Object> model = new HashMap<>();
        model.put("torneos", torneoService.cargarTorneos());
        model.put("user", context.sessionAttribute("user"));
        context.render("/templates/principal.ftl", model);
    }

    public static void servirLogin(@NotNull Context context) {
        Map<String, Object> model = new HashMap<>();
        if (context.queryParam("error") != null) {
            model.put("error", "Email o contraseña incorrectos");
        }
        context.render("/templates/login.ftl", model);
    }

    public static void login(@NotNull Context context) {
        String email = context.formParam("email");
        String pass = context.formParam("password");
        User user = userService.login(email, pass);

        if (user != null) {
            context.sessionAttribute("user", user);
            if ("admin".equals(user.getRol())){
                context.redirect("/panelAdmin");
            } else {
                context.redirect("/principal");
            }
        }
    }

    public static void logout(@NotNull Context context) {
        context.consumeSessionAttribute("user");
        context.redirect("/principal");
    }



    public static void servirJugadores(@NotNull Context context) {

        String torneoIdParam = context.queryParam("torneoId");
        Map<String, Object> datos = new HashMap<>();

        if (torneoIdParam != null && !torneoIdParam.isEmpty()) {

        int torneoId = Integer.parseInt(torneoIdParam);

        Torneo torneo = torneoService.obtenerTorneo(torneoId);

        List<User> jugadores = TorneoController.userService.obtenerUsuariosPorTorneo(torneoId);


        datos.put("torneo", torneo);
        datos.put("jugadores", jugadores);
        datos.put("modo", "torneo");

        } else {

            List<User> todosLosJugadores = userService.obtenerUsuarios();

            datos.put("jugadores", todosLosJugadores);
            datos.put("modo", "general");

        }

        datos.put("user", context.sessionAttribute("user"));
        context.render("templates/Jugadores.ftl", datos);
    }

    public static void servirCampoBatalla(@NotNull Context context) {
        Map<String, Object> model = new HashMap<>();
        model.put("user", context.sessionAttribute("user"));
        context.render("/templates/campoBatalla.ftl", model);
    }

    public static void servirClasificaciones(@NotNull Context context) {
        Map<String, Object> model = new HashMap<>();
        model.put("user", context.sessionAttribute("user"));
        context.render("/templates/clasificaciones.ftl", model);
    }

    public static void servirGestionUsuarios(@NotNull Context context) {
        String torneoIdParam = context.queryParam("torneoId");
        Map<String, Object> model = new HashMap<>();
        List<Torneo> torneos = torneoService.obtenerTorneos();

        for (Torneo t : torneos) {
            List<User> usuarios = userService.obtenerUsuariosPorTorneo(t.getId());
            t.setUsuarios(usuarios);
        }

        model.put("usuarios", userService.obtenerUsuarios());
        model.put("torneos", torneos);
        model.put("torneoSeleccionado", torneoIdParam);
        model.put("user", context.sessionAttribute("user"));
        context.render("/templates/gestionUsuarios.ftl", model);
    }

    public static void servirCrearJugador(@NotNull Context context) {
        String nombre = context.formParam("nombre");
        String alias = context.formParam("alias");
        String email = context.formParam("email");
        String password = context.formParam("contraseña");
        String nivelStr = context.formParam("nivel");
        String torneoIdParam = context.formParam("torneoId");

        if (nivelStr == null || nivelStr.isEmpty()) {
            context.redirect("/crearJugador?error=El+nivel+es+obligatorio");
            return;
        }
        int nivel = Integer.parseInt(nivelStr);

        String copasStr = context.formParam("copas");
        copasStr = copasStr.replace(".", "");
        int copas = Integer.parseInt(copasStr);
        String clan = context.formParam("clan");
        String rol = context.formParam("rol");
        String img = context.formParam("img");

        if (email == null || email.trim().isEmpty()) {
            context.redirect("/crearJugador?error=Email+obligatorio");
            return;
        }

        if (password == null || password.trim().isEmpty()) {
            context.redirect("/crearJugador?error=Contraseña+obligatoria");
            return;
        }

        if (alias == null || alias.trim().isEmpty()) {
            context.redirect("/crearJugador?error=Alias+obligatorio");
            return;
        }


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

        boolean creado = userService.crearUsuario(user.getEmail(),user.getPassword(),user.getRol(),user.getAlias(),user.getNombre(),user.getNivel(),user.getCopas(),user.getClan(),user.getImg());

        if (creado) {
            int torneoId = Integer.parseInt(torneoIdParam);
            User nuevoUsuario = userService.obtenerUsuarioPorEmail(email);
            if (nuevoUsuario != null) {
                torneoService.agregarUsuarioATorneo(torneoId, nuevoUsuario.getId());
            }
            context.redirect("/cambioArena");
        } else {
            context.redirect("/crearJugador");
        }

        Map<String, Object> model = new HashMap<>();
        context.render("templates/creacionUsuarios.ftl",model);
    }

    public static void cambioArena(@NotNull Context context) {
        Map<String, Object> model = new HashMap<>();

        String origen = context.queryParam("origen");
        String torneoId = context.queryParam("torneoId");

        if (origen != null && origen.equals("crearJugador")) {
            model.put("redirectTo", "/gestionUsuarios");
            model.put("torneoId", torneoId);
            model.put("mensaje", "Jugador creado correctamente");
        } else {
            model.put("redirectTo", "/listaTorneo");
            model.put("mensaje", "Cambios aplicados correctamente");
        }

        model.put("user", context.sessionAttribute("user"));
        context.render("/templates/cambioArena.ftl", model);
    }

    public static void mostrarFormularioCrearJugador(@NotNull Context context) {
        String torneoIdParam = context.queryParam("torneoId");
        Map<String, Object> model = new HashMap<>();
        model.put("user", context.sessionAttribute("user"));
        model.put("torneoId", torneoIdParam);
        context.render("templates/creacionUsuarios.ftl", model);
    }

    public static void servirEditarJugador(@NotNull Context context) {
        int id = Integer.parseInt(context.pathParam("id"));

        User user = userService.obtenerUsuario(id);

        Map<String, Object> model = new HashMap<>();
        model.put("user", user);
        model.put("sessionUser", context.sessionAttribute("user"));
        context.render("/templates/editarJugador.ftl", model);
    }

    public static void actualizarJugador(@NotNull Context context){
        int id = Integer.parseInt(context.formParam("id"));
        String email = context.formParam("email");
        String alias = context.formParam("alias");
        String nombre = context.formParam("nombre");
        String contraseña = context.formParam("contraseña");
        String img = context.formParam("img");
        int nivel = Integer.parseInt(context.formParam("nivel"));

        String copasStr = context.formParam("copas");
        copasStr = copasStr.replace(".", "");
        int copas = Integer.parseInt(copasStr);

        String clan = context.formParam("clan");
        String rol = context.formParam("rol");

        User userActualizado = new User(id, email, contraseña, rol, alias, nombre, nivel, copas, clan, img);

        userService.actualizarUsuario(userActualizado);

        context.redirect("/gestionUsuarios");
    }

    public static void confirmarAccionJugador(@NotNull Context context) {
        String idParam = context.formParam("id");
        int id = (idParam != null) ? Integer.parseInt(idParam) : 0;

        String alias = context.formParam("alias");
        String clan = context.formParam("clan");
        if (clan == null || clan.isEmpty()) { clan = "Sin Clan"; }

        String nivelStr = context.formParam("nivel");
        String copasStr = context.formParam("copas");
        copasStr = copasStr.replace(".", "");

        Map<String, Object> model = new HashMap<>();
        model.put("id", id);
        model.put("email", context.formParam("email"));
        model.put("password", context.formParam("password"));
        model.put("rol", context.formParam("rol"));
        model.put("alias", alias);
        model.put("nombre", context.formParam("nombre"));
        model.put("nivel", Integer.parseInt(nivelStr));
        model.put("copas", Integer.parseInt(copasStr));
        model.put("clan", clan);
        model.put("img", context.formParam("img"));
        model.put("mensaje", "¿Deseas guardar los cambios de " + alias + "?");
        model.put("user", context.sessionAttribute("user"));

        context.render("templates/cuadroEmergencia.ftl", model);
    }

    public static void ejecutarGuardadoDefinitivo(@NotNull Context context) {
        String idParam = context.formParam("id");
        int id = (idParam != null && !idParam.isEmpty()) ? Integer.parseInt(idParam) : 0;

        String email = context.formParam("email");
        String pass = context.formParam("password");
        String rol = context.formParam("rol");
        String alias = context.formParam("alias");
        String nombre = context.formParam("nombre");
        String clan = context.formParam("clan");
        String img = context.formParam("img");
        if (clan == null || clan.isEmpty()) { clan = "Sin Clan"; }

        String nivelStr = context.formParam("nivel").replace(".", "");
        String copasStr = context.formParam("copas").replace(".", "");
        int nivel = Integer.parseInt(nivelStr);
        int copas = Integer.parseInt(copasStr);

        if (id == 0) {
            userService.crearUsuario(email, pass, rol, alias, nombre, nivel, copas, clan,img);
        } else {
            User existente = userService.obtenerUsuario(id);
            String passwordFinal = (pass != null && !pass.isEmpty()) ? pass : existente.getPassword();
            User actualizado = new User(id, email, passwordFinal, rol, alias, nombre, nivel, copas, clan, img);
            userService.actualizarUsuario(actualizado);
        }

        context.redirect("/gestionUsuarios");
    }

    public static void servirEliminarJugador(@NotNull Context context) {
        int id = Integer.parseInt(context.pathParam("id"));
        User user = userService.obtenerUsuario(id);
        Map<String, Object> model = new HashMap<>();
        model.put("user", user);
        context.render("/templates/eliminarJugador.ftl", model);
    }

    public static void ejecutarEliminarJugador(@NotNull Context context) {
        int id = Integer.parseInt(context.pathParam("id"));

        userService.eliminarTorneosDeUsuarios(id);
        userService.eliminarUsuario(id);
        context.redirect("/gestionUsuarios");
    }



    public static void servirPanelAdmin(@NotNull Context context) {
        Map<String, Object> model = new HashMap<>();
        model.put("torneos", torneoService.cargarTorneos());
        model.put("user", context.sessionAttribute("user"));
        context.render("/templates/panelAdmin.ftl", model);
    }

    public static void servirListaTorneos(@NotNull Context context) {
        Map<String, Object> model = new HashMap<>();
        model.put("torneos", torneoService.cargarTorneos());
        model.put("user", context.sessionAttribute("user"));
        context.render("/templates/listaTorneos.ftl", model);
    }

    public static void servirCrearTorneo(@NotNull Context context) {
        Map<String, Object> model = new HashMap<>();
        model.put("user", context.sessionAttribute("user"));
        context.render("/templates/creacionTorneos.ftl", model);
    }

    public static void guardarTorneo(@NotNull Context context) {
        String nombre = context.formParam("nombre");
        String arena = context.formParam("arena");

        String copasStr = context.formParam("numeroCopas");
        copasStr = copasStr.replace(".", "");
        int copas = Integer.parseInt(copasStr);

        int cantidadJugadores = Integer.parseInt(context.formParam("cantidadJugadores"));

        torneoService.crearTorneo(nombre, copas, arena, cantidadJugadores);
        context.redirect("/listaTorneo");
    }

    public static void servirEditarTorneo(@NotNull Context context) {
        int id = Integer.parseInt(context.pathParam("id"));
        Torneo torneo = torneoService.obtenerTorneo(id);

        Map<String, Object> model = new HashMap<>();
        model.put("torneo", torneo);
        model.put("user", context.sessionAttribute("user"));
        context.render("/templates/editarTorneos.ftl", model);
    }

    public static void actualizarTorneo(@NotNull Context context) {
        int id = Integer.parseInt(context.formParam("id"));
        String arena = context.formParam("arena");
        String nombre = context.formParam("nombre");
        int cantidadJugadores = Integer.parseInt(context.formParam("cantidadJugadores"));

        String numeroCopasStr = context.formParam("numeroCopas");
        numeroCopasStr = numeroCopasStr.replace(".", "");
        int numeroCopas = Integer.parseInt(numeroCopasStr);


        Torneo torneo = torneoService.obtenerTorneo(id);
        torneoService.actualizarTorneo(id,nombre,numeroCopas,arena,cantidadJugadores);

        context.redirect("/listaTorneo");
    }

    public static void ejecutarEditarTorneo(@NotNull Context context) {
        context.redirect("/listaTorneos");
    }

    public static void servirEliminarTorneo(@NotNull Context context) {
        int id = Integer.parseInt(context.pathParam("id"));
        Torneo torneo = torneoService.obtenerTorneo(id);
        Map<String, Object> model = new HashMap<>();
        model.put("torneo", torneo);
        model.put("user", context.sessionAttribute("user"));
        context.render("/templates/eliminarTorneo.ftl", model);
    }

    public static void ejecutarEliminarTorneo(@NotNull Context context) {
        int id = Integer.parseInt(context.pathParam("id"));

        torneoService.eliminarUsuariosDeTorneo(id);
        torneoService.eliminarTorneo(id);
        context.redirect("/listaTorneo");
    }
}