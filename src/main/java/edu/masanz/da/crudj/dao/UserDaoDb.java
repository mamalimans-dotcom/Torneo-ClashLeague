package edu.masanz.da.crudj.dao;

import edu.masanz.da.crudj.database.ConnectionManager;
import edu.masanz.da.crudj.dto.User;

import java.util.ArrayList;
import java.util.List;

public class UserDaoDb {

    public UserDaoDb() {

    }

    public User obtenerPorEmail(String email) {

        String sql = "SELECT id, email, password, rol, alias, nombre, nivel, copas FROM users WHERE email = ?";
        Object[] params = {email};

        Object[][] resultado = ConnectionManager.ejecutarSelectSQL(sql, params);

        if (resultado != null && resultado.length == 1) {
            User user = new User();
            user.setId((Integer) resultado[0][0]);
            user.setEmail((String) resultado[0][1]);
            user.setPassword((String) resultado[0][2]);
            user.setRol((String) resultado[0][3]);
            user.setAlias((String) resultado[0][4]);
            user.setNombre((String) resultado[0][5]);
            user.setNivel((Integer) resultado[0][6]);
            user.setCopas((Integer) resultado[0][7]);
            return user;
        }
        return null;
    }

    public static User obtenerUsuario(int id) {
        String sql = "SELECT id, email, password, rol, alias, nombre, nivel, copas " +
                "FROM users WHERE id = ? ORDER BY id DESC LIMIT 1";
        Object[] params = {id};
        Object[][] resultado = ConnectionManager.ejecutarSelectSQL(sql, params);
        if (resultado != null && resultado.length == 1) {
            User user = new User();

            user.setId((Integer) resultado[0][0]);
            user.setEmail((String) resultado[0][1]);
            user.setPassword((String) resultado[0][2]);
            user.setRol((String) resultado[0][3]);
            user.setAlias((String) resultado[0][4]);
            user.setNombre((String) resultado[0][5]);
            user.setNivel((Integer) resultado[0][6]);
            user.setCopas((Integer) resultado[0][7]);

            return user;
        }
        return null;
    }

    public static boolean actualizarUsuario(User user) {
        String sql = "UPDATE users SET email = ?, password = ?, rol = ?, alias = ?, nombre = ?, nivel = ?, copas = ? WHERE id = ?"; //termianr
        Object[] params = {user.getEmail(), user.getPassword(), user.getRol(), user.getAlias(),user.getNombre(), user.getNivel(), user.getCopas(), user.getId()};
        ConnectionManager.ejecutarUpdateSQL(sql, params);
        return true;
    }



    public static boolean eliminarUsuario(int id) {
        String sql = "DELETE FROM users WHERE id = ?";
        Object[] params = {id};
        ConnectionManager.ejecutarUpdateSQL(sql, params);
        return true;
    }

    public static boolean inicializarUsuario() {
        ConnectionManager.conectar("crud_clash", "root", "roo7");
        return true;
    }

    public static List<User> obtenerUsuarios() {
        List<User> users = new ArrayList<>();

        String sql = "SELECT id, email, password, rol, alias, nombre, nivel, copas " +
                "FROM users ORDER BY id DESC";
        Object[] params = {};
        Object[][] resultado = ConnectionManager.ejecutarSelectSQL(sql, params);
        if (resultado != null && resultado.length>0) {
            for(int i = 0; i < resultado.length; i++) {
                User user = new User();
                user.setId((Integer) resultado[i][0]);
                user.setEmail((String) resultado[i][1]);
                user.setPassword((String) resultado[i][2]);
                user.setRol((String) resultado[i][3]);
                user.setAlias((String) resultado[i][4]);
                user.setNombre((String) resultado[i][5]);
                user.setNivel((Integer) resultado[i][6]);
                user.setCopas((Integer) resultado[i][7]);
                users.add(user);
            }
        }
        return users;
    }

    public static boolean crearUsuario(String email, String password, String rol, String alias, String nombre, String nivel, int copas) {
        String sql = "INSERT INTO users (email, password, rol, alias, nombre, nivel, copas) VALUES (?, ?, ?, ?, ?, ?, ?)";
        Object[] params = {email, password, rol, alias, nombre, nivel, copas};
        long id = ConnectionManager.ejecutarInsertSQL(sql, params);
        if (id > 0){
            System.out.println("item insertado correctamente");
            return true;
        } else {
            System.out.println("algo ha ido mal en el insert: ["+sql+"] con estos paramentros: ["+params[0]+", "+params[1]+", "+params[2]+", "+params[3]+", "+params[4]+", "+params[5]+", "+params[6]+"]");
            return false;
        }
    }
}