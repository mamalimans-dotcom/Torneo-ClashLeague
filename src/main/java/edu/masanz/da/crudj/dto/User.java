package edu.masanz.da.crudj.dto;

public class User {
    private int id;
    private String email;
    private String password;
    private String rol;
    private String alias;
    private String nombre;
    private int nivel;
    private int copas;
    private String clan;
    private String img;


    public User() {}


    public User(int id, String email, String password, String rol, String alias, String nombre, int nivel, int copas, String clan, String img) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.rol = rol;
        this.alias = alias;
        this.nombre = nombre;
        this.nivel = nivel;
        this.copas = copas;
        this.clan = clan;
        this.img = img;
    }


    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getRol() { return rol; }
    public void setRol(String rol) { this.rol = rol; }
    public String getAlias() { return alias; }
    public void setAlias(String alias) { this.alias = alias; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public int getNivel() { return nivel; }
    public void setNivel(int nivel) { this.nivel = nivel; }
    public int getCopas() { return copas; }
    public void setCopas(int copas) { this.copas = copas; }
    public String getClan() { return clan; }
    public void setClan(String clan) { this.clan = clan; }
    public String getImg() {
        return img;
    }
    public void setImg(String img) {
        this.img = img;
    }
}