package edu.masanz.da.crudj.service;

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

    public List<User> obtenerUsuarios() {
        return userDao.obtenerUsuarios();
    }


    public User obtenerUsuario(int id) {
        return userDao.obtenerPorId(id);
    }


    public boolean crearUsuario(String email, String contraseña, String rol, String alias, String nombre, int nivel, int copas, String clan, String img) {
        return userDao.crear(email,contraseña,rol,alias,nombre,nivel,copas, clan, img);
    }


    public boolean actualizarUsuario(User user) {
        if (user == null || user.getId() <= 0) return false;
        return userDao.actualizar(user);
    }

    public User obtenerUsuarioPorEmail(String email){
        return userDao.obtenerPorEmail(email);
    }


    public boolean eliminarUsuario(int id) {
        if (id <= 0) return false;
        return userDao.eliminar(id);
    }

    public List<User> obtenerUsuariosPorTorneo(int torneoId) {
        return userDao.obtenerUsuariosPorTorneo(torneoId);
    }

    public int eliminarTorneosDeUsuarios(int idUsuario){
        return userDao.eliminarUsuariosDeTorneo(idUsuario);
    }
}