package com.sanvalero.easteregg.dao;

import com.sanvalero.easteregg.domain.Juego;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class JuegoDAO {
      
    private Conexion conexion;
    
    /**
     * Añade un juego a la base de datos
     * @param juego El juego con la información que se quiere registrar
     * @throws SQLException
     */
    public void registrarJuego(Juego juego) throws SQLException {
        
    }
    
    /**
     * Obtiene la lista de juegos de la base de datos
     * @return Una colección con los juegos
     */
    public ArrayList<Juego> getJuegos() throws SQLException {        
        return new ArrayList<>();
    }
    
    /**
     * Elimina un juego
     * @param idJuego El id del juego a eliminar
     */
    public void eliminarJuego(int idJuego) {
        
    }
    
    /**
     * Modifica la información de un juego
     * @param juego El juego con la información a modificar
     */
    public void modificarJuego(Juego juego) {
        
    }
}
