package edu.masanz.da.crudj.dao;

import edu.masanz.da.crudj.database.ConnectionManager;
import edu.masanz.da.crudj.dto.Torneo;

import java.util.ArrayList;
import java.util.List;

public class TorneoDao {
    private Torneo mapear(Object[] f) {
        return new Torneo((int)f[0], (String)f[1],(int)f[2],(String) f[3],(int)f[4]);
    }
    public static List<Torneo> cargarTorneos() {
        List<Torneo> lista = new ArrayList<>();
        Object[][] res = ConnectionManager.ejecutarSelectSQL("SELECT id, nombre, numeroCopas, arena, numJugadores FROM torneos", null);
        if (res != null) {
            for (Object[] f : res) lista.add(new Torneo((int)f[0], (String)f[1], (int)f[2], (String) f[3], (int) f[4]));
        }
        return lista;
    }

    public List<Torneo> obtenerTorneos() {
        List<Torneo> torneos = new ArrayList<>();
        Object[][] resultados = ConnectionManager.ejecutarSelectSQL(
                "SELECT id, nombre, numeroCopas, arena, numJugadores FROM torneos",
                null
        );
        if (resultados != null) {
            for (Object[] fila : resultados) {
                torneos.add(mapear(fila));
            }
        }
        return torneos;
    }

    public static int crearTorneos(String nombre, int copas, String arena, int numJugadores) {
        return (int) ConnectionManager.ejecutarInsertSQL("INSERT INTO torneos (nombre, numeroCopas, arena, numJugadores) VALUES (?, ?, ?, ?)", new Object[]{nombre, copas, arena, numJugadores});
    }

    public static int eliminarTorneos(int id) {
        return ConnectionManager.ejecutarUpdateSQL("DELETE FROM torneos WHERE id = ?", new Object[]{id});
    }

    public static int actualizarTorneo(int id, String nombre, int numeroCopas, String arena, int numJugadores) {
        String sql = "UPDATE torneos SET nombre = ?, numeroCopas = ?, arena = ?, numJugadores = ? WHERE id = ?";
        return ConnectionManager.ejecutarUpdateSQL(sql, new Object[]{nombre, numeroCopas, arena, numJugadores, id});
    }

    public static int eliminarUsuariosDeTorneo(int idTorneo) {
        return ConnectionManager.ejecutarUpdateSQL("DELETE FROM usuario_torneo WHERE torneo_id = ?", new Object[]{idTorneo});
    }

    public boolean agregarUsuarioATorneo(int torneoId, int usuarioId) {
        String sql = "INSERT INTO usuario_torneo (torneo_id, usuario_id) VALUES (?, ?)";
        int resultado = ConnectionManager.ejecutarUpdateSQL(sql, new Object[]{torneoId, usuarioId});
        return resultado > 0;
    }

}