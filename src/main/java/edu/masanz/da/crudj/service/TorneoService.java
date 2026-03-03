package edu.masanz.da.crudj.service;

import edu.masanz.da.crudj.dao.TorneoDao;
import edu.masanz.da.crudj.dto.Torneo;

import java.util.List;

public class TorneoService {


    public static List<Torneo> cargarTorneos(){

        return TorneoDao.cargarTorneos();
    }
}
