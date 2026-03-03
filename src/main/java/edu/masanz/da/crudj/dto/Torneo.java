package edu.masanz.da.crudj.dto;

public class Torneo {
    private int id;
    private String nombre;
    private int NumeroCopas;


    public Torneo(int id, String nombre, int numeroCopas) {
        this.id = id;
        this.nombre = nombre;
        NumeroCopas = numeroCopas;
    }

    public Torneo() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getNumeroCopas() {
        return NumeroCopas;
    }

    public void setNumeroCopas(int numeroCopas) {
        NumeroCopas = numeroCopas;
    }
}
