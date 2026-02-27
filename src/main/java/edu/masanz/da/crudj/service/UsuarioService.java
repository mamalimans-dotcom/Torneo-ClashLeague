package edu.masanz.da.crudj.service;

import edu.masanz.da.crudj.dao.UsuarioDao;
import edu.masanz.da.crudj.dto.Usuario;

import java.util.List;

public class UsuarioService {

    private UsuarioDao usuarioDao;

    public UsuarioService(){
        usuarioDao = new UsuarioDao();
    }

    public Usuario obtenerUsuario(int id) {
        return usuarioDao.obtenerUsuario(id);
    }

    public boolean actualizarUsuario(Usuario usuario) {
        return usuarioDao.actualizarUsuario(usuario);
    }

    public boolean eliminarUsuario(Usuario deleteUsuario) {
        return usuarioDao.eliminarUsuario(deleteUsuario);
    }

    public boolean eliminarUsuario(int id) {
        return usuarioDao.eliminarUsuario(id);
    }

    public boolean inicializarUsuario() {
        return usuarioDao.inicializarUsuario();
    }

    public List<Usuario> obtenerUsuarios() {
        return usuarioDao.obtenerUsuarios();
    }

    public boolean crearUsuario(String email, String contraseña, String rol) {
        return usuarioDao.crearUsuario(email,contraseña,rol);
    }

}
