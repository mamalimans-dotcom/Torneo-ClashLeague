package edu.masanz.da.crudj.dao;

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

    public static boolean crearTorneos( String nombre, int NumeroCopas){
        String sql = "INSERT INTO torneos (nombre, NumeroCopas) VALUES (?,?,?)";
        Object[] params = {nombre, NumeroCopas};
        long id = ConnectionManager.ejecutarInsertSQL(sql, params);
        if (id > 0){
            System.out.println("Torneo creado");
            return true;
        }else {
            System.out.println("Error en el inser ["+sql+"] con los siguientes parametros ["+params[0]+", "+params[1]+"]");
        }
        return false;
    }

    public static int eliminarTorneos(int id){
        int n = 0;
        String sql = "DELETE FROM torneos WHERE id = ?";
        Object[] params = {id};
        n = ConnectionManager.ejecutarUpdateSQL(sql, params);
        return n;
    }

    public static boolean actualizarTorneos(Torneo torneo){
        String sql = "UPDATE torneos set nombre=? , numeroCopas= ?";
        return true;
    }
}

