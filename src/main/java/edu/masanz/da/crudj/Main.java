package edu.masanz.da.crudj;

import edu.masanz.da.crudj.controller.TorneoController;
import edu.masanz.da.crudj.database.ConnectionManager;

import io.javalin.Javalin;
import io.javalin.rendering.template.JavalinFreemarker;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Main {

    private static final Logger logger = LogManager.getLogger(Main.class);

    public static void main(String[] args) {

        logger.info("ARRANCANDO APLICACION");

        ConnectionManager.conectar("crud_clash", "proy", "password");

        Javalin app = Javalin.create(config -> {
            config.staticFiles.add("public");
            config.fileRenderer(new JavalinFreemarker());
        }).start(8080);

        app.before("/listaTorneos", TorneoController::Before);
        app.get("/", ctx -> ctx.redirect("/login"));
        app.get("/login", TorneoController::servirLogin);
        app.post("/login", TorneoController::login);
        app.get("/jugadores", ctx -> {
            ctx.render("templates/jugadores.ftl");
        });
        app.get("/crearTorneo", TorneoController::crearTorneo);
        app.after("",TorneoController::after);

        app.get("/jugadores", TorneoController::crearTorneo);
        app.after("Jugadores",TorneoController::after);

    }
}