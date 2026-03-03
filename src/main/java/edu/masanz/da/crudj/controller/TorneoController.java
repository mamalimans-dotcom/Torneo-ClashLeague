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
import java.util.ArrayList;
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

    public static void listaJugadores() throws SQLException, IOException, TemplateException { //Para el ftl de jugadores

        List<User> jugadores = new ArrayList<>();
        Connection con = ConnectionManager.getConexion();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM usuarios");
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            User u = new User();
            u.setId(rs.getInt("id"));
            u.setEmail(rs.getString("email"));
            u.setRol(rs.getString("rol"));
            u.setAlias(rs.getString("alias"));
            u.setNombre(rs.getString("nombre"));
            u.setNivel(rs.getString("nivel"));
            u.setCopas(rs.getInt("copas"));
            jugadores.add(u);
        }

        rs.close();
        ps.close();


        Map<String, Object> datos = new HashMap<>();
        datos.put("jugadores", jugadores);


        Configuration cfg = new Configuration(Configuration.VERSION_2_3_31);
        cfg.setDirectoryForTemplateLoading(new File("src/main/resources/templates")); // tu FTL aquí
        cfg.setDefaultEncoding("UTF-8");

        Template template = cfg.getTemplate("Jugadores.ftl");


        Writer out = new FileWriter("salida.html");
        template.process(datos, out);
        out.close();


    }



}
