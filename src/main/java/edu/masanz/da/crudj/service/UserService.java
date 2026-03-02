package edu.masanz.da.crudj.service;

import edu.masanz.da.crudj.dao.UserDaoDb;
import edu.masanz.da.crudj.dto.User;

import java.util.List;

public class UserService {

    private UserDaoDb userDao = new UserDaoDb();

    public User login(String email, String password) {

        User user = userDao.obtenerPorEmail(email);

        if (user != null && user.getPassword().equals(password)) {
            return user;
        }

        return null;
    }

    public User obtenerUsuario(int id) {
        return userDao.obtenerUsuario(id);
    }

    public boolean actualizarUsuario(User user) {
        return userDao.actualizarUsuario(user);
    }

    public boolean eliminarUsuario(User deleteUser) {
        return userDao.eliminarUsuario(deleteUser);
    }

    public boolean eliminarUsuario(int id) {
        return userDao.eliminarUsuario(id);
    }

    public boolean inicializarUsuario() {
        return userDao.inicializarUsuario();
    }

    public List<User> obtenerUsuarios() {
        return userDao.obtenerUsuarios();
    }

    public boolean crearUsuario(String email, String contraseña, String rol) {
        return userDao.crearUsuario(email,contraseña,rol);
    }

}