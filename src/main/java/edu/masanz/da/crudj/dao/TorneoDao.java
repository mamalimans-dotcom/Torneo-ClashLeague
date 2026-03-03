package edu.masanz.da.crudj.dao;

import com.sun.jdi.connect.spi.Connection;
import edu.masanz.da.crudj.database.ConnectionManager;
import edu.masanz.da.crudj.dto.Torneo;

import java.util.ArrayList;
import java.util.List;

public class TorneoDao {
    public static List<Torneo> cargarTorneos(){

        List<Torneo> torneos = new ArrayList<>();
        String sql = "SELECT id, nombre, NumeroCopas FROM Torneo";
        Object[] parametros = {};
        Object[][] resultado = ConnectionManager.ejecutarSelectSQL(sql, parametros );

        if(resultado != null && resultado.length > 0){
            for(int i=0;i < resultado.length;i++){
                Torneo torneo = new Torneo();
                torneo.setId((int) resultado[i][0]);
                torneo.setNombre((String) resultado[i][1]);
                torneo.setNumeroCopas((int) resultado[i][2]);
                torneos.add(torneo);
            }
        }
        return torneos;
    }
}
