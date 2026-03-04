package edu.masanz.da.crudj.service;

import edu.masanz.da.crudj.dao.TorneoDao;
import edu.masanz.da.crudj.dto.Torneo;
import org.jetbrains.annotations.NotNull;

import java.util.List;

public class TorneoService {


    public static List<Torneo> cargarTorneos(){

        return TorneoDao.cargarTorneos();
    }

    public int crearTorneo(String nombre, int NumeroCopas) {
        if (nombre == null || nombre.isEmpty()){
            return 0;
        }
        if (NumeroCopas < 0){
            return 0;
        }
        return TorneoDao.crearTorneos(nombre, NumeroCopas);
    }

    public int eliminarTorneo(int id) {
        if (id < 0){
            return 0;
        }
        return TorneoDao.eliminarTorneos(id);
    }
}
