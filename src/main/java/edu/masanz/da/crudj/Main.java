package edu.masanz.da.crudj;

import edu.masanz.da.crudj.controller.TorneoController;
import io.javalin.http.staticfiles.Location;

import io.javalin.Javalin;
import io.javalin.rendering.template.JavalinFreemarker;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Main {

    private static final Logger logger = LogManager.getLogger(Main.class);

    public static void main(String[] args) {

        logger.info("ARRANCANDO APLICACION");

        Javalin app = Javalin.create(config -> {
            config.staticFiles.add("public");
            config.fileRenderer(new JavalinFreemarker());
        }).start(8080);

        app.get("/", TorneoController::cargarTorneos);
        app.post("/login", TorneoController::login);
        app.get("/crearTorneo", TorneoController::crearTorneo);

    }
}