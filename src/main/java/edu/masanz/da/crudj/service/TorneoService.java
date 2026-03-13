package edu.masanz.da.crudj.service;

import edu.masanz.da.crudj.dao.TorneoDao;
import edu.masanz.da.crudj.dto.Torneo;

import java.util.List;

public class TorneoService {

    private TorneoDao torneoDao = new TorneoDao();

    public List<Torneo> cargarTorneos() {
        return TorneoDao.cargarTorneos();
    }


    public int crearTorneo(String nombre, int numeroCopas, String arena, int numJugadores) {
        if (nombre == null || nombre.trim().isEmpty()) {
            return 0;
        }
        if (numeroCopas < 0) numeroCopas = 0;

        return TorneoDao.crearTorneos(nombre, numeroCopas, arena, numJugadores);
    }


    public Torneo obtenerTorneo(int id) {
        List<Torneo> torneos = TorneoDao.cargarTorneos();
        return torneos.stream()
                .filter(t -> t.getId() == id)
                .findFirst()
                .orElse(null);
    }


    public boolean actualizarTorneo(int id, String nombre, int numeroCopas, String arena, int numJugadores) {
        if (id <= 0) return false;
        return TorneoDao.actualizarTorneo(id, nombre, numeroCopas, arena, numJugadores) > 0;
    }


    public boolean eliminarTorneo(int id) {
        if (id <= 0) return false;
        return TorneoDao.eliminarTorneos(id) > 0;
    }

    public List<Torneo> obtenerTorneos() {
        return torneoDao.obtenerTorneos();
    }

    public int eliminarUsuariosDeTorneo(int idTorneo){
        return torneoDao.eliminarUsuariosDeTorneo(idTorneo);
    }

    public boolean agregarUsuarioATorneo(int torneoId, int usuarioId){
        return torneoDao.agregarUsuarioATorneo(torneoId, usuarioId);
    }



}