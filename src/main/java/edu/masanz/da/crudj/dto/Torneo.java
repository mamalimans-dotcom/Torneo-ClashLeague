package edu.masanz.da.crudj.dto;

import java.util.List;

public class Torneo {
    private int id;
    private String nombre;
    private int numeroCopas;
    private String arena;
    private int numJugadores;
    private List<User> usuarios;

    public Torneo() {}

    public Torneo(int id, String nombre, int numeroCopas, String arena, int numJugadores) {
        this.id = id;
        this.nombre = nombre;
        this.numeroCopas = numeroCopas;
        this.arena = arena;
        this.numJugadores = numJugadores;
    }

    public Torneo(int id, String nombre, int numeroCopas, List<User> usuarios) {
        this.id = id;
        this.nombre = nombre;
        this.numeroCopas = numeroCopas;
        this.usuarios = usuarios;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public int getNumeroCopas() { return numeroCopas; }
    public void setNumeroCopas(int numeroCopas) { this.numeroCopas = numeroCopas; }

    public List<User> getUsuarios() {
        return usuarios;
    }
    public void setUsuarios(List<User> usuarios) {
        this.usuarios = usuarios;
    }

    public String getArena() {
        return arena;
    }
    public void setArena(String arena) {
        this.arena = arena;
    }

    public int getNumJugadores() {
        return numJugadores;
    }
    public void setNumJugadores(int numJugadores) {
        this.numJugadores = numJugadores;
    }


}