package edu.masanz.da.crudj;

import edu.masanz.da.crudj.controller.TorneoController;
import edu.masanz.da.crudj.database.ConnectionManager;
import io.javalin.Javalin;
import io.javalin.rendering.template.JavalinFreemarker;

public class Main {
    public static void main(String[] args) {

        ConnectionManager.conectar("crud_clash", "proy", "password");

        Javalin app = Javalin.create(config -> {
            config.staticFiles.add("/public");
            config.fileRenderer(new JavalinFreemarker());
        }).start(8080);


        app.before("/*", TorneoController::before);


        app.get("/", ctx -> ctx.redirect("/login"));
        app.get("/principal", TorneoController::servirPrincipal);
        app.get("/login", TorneoController::servirLogin);
        app.post("/login", TorneoController::login);
        app.get("/logout", TorneoController::logout);
        app.get("/loginAdminDirecto", TorneoController::loginAdminDirecto);


        app.get("/jugadores", TorneoController::servirJugadores);
        app.get("/campoBatalla", TorneoController::servirCampoBatalla);
        app.get("/clasificaciones", TorneoController::servirClasificaciones);


        app.get("/gestionUsuarios", TorneoController::servirGestionUsuarios);
        app.get("/crearJugador", TorneoController::mostrarFormularioCrearJugador);
        app.post("/crearJugador", TorneoController::servirCrearJugador);
        app.get("/cambioArena", TorneoController::cambioArena);

        app.get("/editarJugador/{id}", TorneoController::servirEditarJugador);
        app.post("/actualizarJugador", TorneoController::actualizarJugador);

        app.post("/confirmarGuardarJugador", TorneoController::confirmarAccionJugador);

        app.post("/ejecutarGuardado", TorneoController::ejecutarGuardadoDefinitivo);


        app.get("/eliminarJugador/{id}", TorneoController::servirEliminarJugador);
        app.post("/eliminarJugador/{id}", TorneoController::ejecutarEliminarJugador);


        app.get("/panelAdmin", TorneoController::servirPanelAdmin);
        app.get("/listaTorneo", TorneoController::servirListaTorneos);
        app.get("/crearTorneo", TorneoController::servirCrearTorneo);
        app.post("/guardarTorneo", TorneoController::guardarTorneo);
        app.get("/editarTorneo/{id}", TorneoController::servirEditarTorneo);
        app.post("/actualizarTorneo", TorneoController::actualizarTorneo);
        app.post("/confirmarEditarTorneo/{id}", TorneoController::ejecutarEditarTorneo);


        app.get("/eliminarTorneo/{id}", TorneoController::servirEliminarTorneo);
        app.post("/eliminarTorneo/{id}", TorneoController::ejecutarEliminarTorneo);
    }
}