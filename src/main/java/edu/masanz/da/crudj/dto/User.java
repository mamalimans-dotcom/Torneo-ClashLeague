
package edu.masanz.da.crudj.dto;

public class User {

    private int id;
    private String email;
    private String password;
    private String rol;
    private String alias;
    private String nombre;
    private String nivel;
    private int copas;

    public User(){}


    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getRol() { return rol; }
    public void setRol(String rol) { this.rol = rol; }

    public String getAlias() {
        return alias;
    }
    public void setAlias(String alias) {
        this.alias = alias;
    }

    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNivel() {
        return nivel;
    }
    public void setNivel(String nivel) {
        this.nivel = nivel;
    }

    public int getCopas() {
        return copas;
    }
    public void setCopas(int copas) {
        this.copas = copas;
    }
}