package edu.masanz.da.crudj.dao;

import edu.masanz.da.crudj.database.ConnectionManager;
import edu.masanz.da.crudj.dto.User;

public class UserDaoDb {

    public UserDaoDb() {

    }

    public User obtenerPorEmail(String email) {

        String sql = "SELECT id, email, password, rol FROM users WHERE email = ?";
        Object[] params = {email};

        Object[][] resultado = ConnectionManager.ejecutarSelectSQL(sql, params);

        if (resultado != null && resultado.length == 1) {
            User user = new User();

            user.setId((int) resultado[0][0]);
            user.setEmail((String) resultado[0][1]);
            user.setPassword((String) resultado[0][2]);
            user.setRol((String) resultado[0][3]);

            return user;
        }

        return null;
    }
}