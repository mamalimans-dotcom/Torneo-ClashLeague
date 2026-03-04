package edu.masanz.da.crudj.dao;

import edu.masanz.da.crudj.database.ConnectionManager;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;
class TorneoDaoTest {

    @BeforeEach
    void setUp() {
        ConnectionManager.conectar("crud_clash", "root", "roo7");
    }

    @Test
    void eliminarTorneos() {
        int n = TorneoDao.eliminarTorneos(4);
        assertEquals(1, n);
    }

}