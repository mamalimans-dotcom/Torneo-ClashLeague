package edu.masanz.da.crudj.dao;

import edu.masanz.da.crudj.database.ConnectionManager;
import edu.masanz.da.crudj.dto.Usuario;

import java.util.ArrayList;
import java.util.List;

public class UsuarioDao {

    public static Usuario obtenerUsuario(int id) {
        String sql = "SELECT id, email, password, rol" +
                "FROM users WHERE id = ? ORDER BY id DESC LIMIT 1";
        Object[] params = {id};
        Object[][] resultado = ConnectionManager.ejecutarSelectSQL(sql, params);
        if (resultado != null && resultado.length == 1) {
            Usuario usuario = new Usuario();

            usuario.setId((Integer) resultado[0][0]);
            usuario.setEmail((String) resultado[0][1]);
            usuario.setPassword((String) resultado[0][2]);
            usuario.setRol((String) resultado[0][3]);

            return usuario;
        }
        return null;
    }

    public static boolean actualizarUsuario(Usuario usuario) {
        String sql = "UPDATE users SET email = ?, password = ?, rol = ? WHERE id = ?";
        Object[] params = {usuario.getEmail(), usuario.getPassword(),usuario.getRol(), usuario.getId()};
        ConnectionManager.ejecutarUpdateSQL(sql, params);
        return true;
    }

    public static boolean eliminarUsuario(Usuario deleteUsuario) {
        String sql = "DELETE FROM users WHERE id = ?";
        Object[] params = {deleteUsuario.getId()};
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
        ConnectionManager.conectar("crud_db", "root", "roo7");
        return true;
    }

    public static List<Usuario> obtenerUsuarios() {
        List<Usuario> usuarios = new ArrayList<>();

        String sql = "SELECT id, email, password, rol" +
                "FROM users ORDER BY id DESC";
        Object[] params = {};
        Object[][] resultado = ConnectionManager.ejecutarSelectSQL(sql, params);
        if (resultado != null && resultado.length>0) {
            for(int i = 0; i < resultado.length; i++) {
                Usuario usuario = new Usuario();
                usuario.setId((Integer) resultado[i][0]);
                usuario.setEmail((String) resultado[i][1]);
                usuario.setPassword((String) resultado[i][2]);
                usuario.setRol((String) resultado[i][3]);
                usuarios.add(usuario);
            }
        }
        return usuarios;
    }

    public static boolean crearUsuario(String email, String contraseña, String rol) {
        String sql = "INSERT INTO users (email, password, rol) VALUES (?, ?, ?)";
        Object[] params = {email, contraseña, rol};
        long id = ConnectionManager.ejecutarInsertSQL(sql, params);
        if (id > 0){
            System.out.println("item insertado correctamente");
        return true;
        } else {
            System.out.println("algo ha ido mal en el insert: ["+sql+"] con estos paramentros: ["+params[0]+", "+params[1]+", "+params[2]+"]");
        return false;
        }
    }

}
