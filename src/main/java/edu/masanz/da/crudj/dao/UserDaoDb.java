package edu.masanz.da.crudj.dao;

import edu.masanz.da.crudj.database.ConnectionManager;
import edu.masanz.da.crudj.dto.User;

import java.util.ArrayList;
import java.util.List;

public class UserDaoDb {
    private User mapear(Object[] f) {
        return new User((int)f[0], (String)f[1], (String)f[2], (String)f[3],
                (String)f[4], (String)f[5], (int)f[6], (int)f[7], (String)f[8], (String)f[9]);
    }

    public List<User> obtenerUsuarios() {
        List<User> usuarios = new ArrayList<>();
        Object[][] resultados = ConnectionManager.ejecutarSelectSQL(
                "SELECT id, email, password, rol, alias, nombre, nivel, copas, clan, img FROM users",
                null
        );
        if (resultados != null) {
            for (Object[] fila : resultados) {
                usuarios.add(mapear(fila));
            }
        }
        return usuarios;
    }

    public boolean crear(String email, String password, String rol, String alias, String nombre, int nivel, int copas, String clan, String img) {
        String sql = "INSERT INTO users (email, password, rol, alias, nombre, nivel, copas, clan, img) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Object[] params = {email, password, rol, alias, nombre, nivel, copas, clan, img};
        long id = ConnectionManager.ejecutarInsertSQL(sql, params);
        if (id > 0){
            System.out.println("item insertado correctamente");
            return true;
        } else {
            System.out.println("algo ha ido mal en el insert: ["+sql+"] con estos paramentros: ["+params[0]+", "+params[1]+", "+params[2]+", "+params[3]+", "+params[4]+", "+params[5]+", "+params[6]+", "+params[7]+", "+params[8]+"]");
            return false;
        }
    }

    public boolean eliminar(int id) {
        return ConnectionManager.ejecutarUpdateSQL("DELETE FROM users WHERE id = ?", new Object[]{id}) > 0;
    }

    public boolean actualizar(User u) {
        String sql = "UPDATE users SET email=?, password=?, rol=?, alias=?, nombre=?, nivel=?, copas=?, clan=?, img=? WHERE id=?";
        Object[] params = {
                u.getEmail(), u.getPassword(), u.getRol(), u.getAlias(),
                u.getNombre(), u.getNivel(), u.getCopas(), u.getClan(),u.getImg(), u.getId()
        };
        return ConnectionManager.ejecutarUpdateSQL(sql, params) > 0;
    }

    public User obtenerPorId(int id) {
        String sql = "SELECT id, email, password, rol, alias, nombre, nivel, copas, clan, img FROM users WHERE id = ?";
        Object[][] res = ConnectionManager.ejecutarSelectSQL(sql, new Object[]{id});

        if (res != null && res.length > 0) {
            return mapear(res[0]);
        }
        return null;
    }

    public User obtenerPorEmail(String email) {

        String sql = "SELECT id, email, password, rol, alias, nombre, nivel, copas, clan, img FROM users WHERE email = ?";
        Object[][] res = ConnectionManager.ejecutarSelectSQL(sql, new Object[]{email});
        if (res != null && res.length > 0) {
            return mapear(res[0]);
        }

        return null;
    }

    public static List<User> obtenerUsuariosPorTorneo(int torneoId) {
        List<User> usuarios = new ArrayList<>();
        String sql = "SELECT u.* FROM users u " +
                "INNER JOIN usuario_torneo ut ON u.id = ut.usuario_id " +
                "WHERE ut.torneo_id = ?";

        Object[] params = {torneoId};
        Object[][] resultados = ConnectionManager.ejecutarSelectSQL(sql, params);

        if (resultados != null) {
            for (Object[] fila : resultados) {
                User user = new User(
                        (int) fila[0],
                        (String) fila[1],
                        (String) fila[2],
                        (String) fila[3],
                        (String) fila[4],
                        (String) fila[5],
                        (int) fila[6],
                        (int) fila[7],
                        (String) fila[8],
                        (String) fila[9]
                );
                usuarios.add(user);
            }
        }
        return usuarios;
    }

    public int eliminarUsuariosDeTorneo(int idUsuario) {
        return ConnectionManager.ejecutarUpdateSQL("DELETE FROM usuario_torneo WHERE usuario_id = ?", new Object[]{idUsuario});
    }
}