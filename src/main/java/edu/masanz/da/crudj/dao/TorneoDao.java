package edu.masanz.da.crudj.dao;

import edu.masanz.da.crudj.dto.Torneo;

import java.util.ArrayList;
import java.util.List;

public class TorneoDao {
    public static List<Torneo> cargarTorneos(){
        List<Torneo> torneos = new ArrayList<>();
        torneos.add(new Torneo(1,"Arena") );
        torneos.add(new Torneo(2,"Arena1") );
        return torneos;
    }
}
