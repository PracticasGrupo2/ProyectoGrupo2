package com.sanvalero.easteregg.dao;

import com.sanvalero.easteregg.domain.Juego;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class JuegoDAO {
      
    private Conexion conexion;

    public JuegoDAO() {
        conexion = new Conexion();
    }
    
    
    
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
        String consulta = "SELECT ID_JUEGO, TITULO, DESCRIPCION FROM JUEGOS";
        
        ArrayList<Juego> listadoJuegos = new ArrayList<>();
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(consulta);
        ResultSet resultado = sentencia.executeQuery();
        
        while(resultado.next()){
            Juego juego = new Juego();
            juego.setIdJuego(resultado.getInt(1));
            juego.setTituloJuego(resultado.getString(2));
            juego.setDescripcionJuego(resultado.getString(3));
            listadoJuegos.add(juego);
           
        }
        return listadoJuegos;
        
    }
    
    /**
     * Elimina un juego
     * @param idJuego El id del juego a eliminar
     */
    public void eliminarJuego(int idJuego) throws SQLException {
        
        
        String consulta = "DELETE FROM JUEGOS WHERE ID_JUEGO = ?";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(consulta);
        
        sentencia.setInt(1, idJuego);
        sentencia.executeUpdate();
    }
    
    /**
     * Modifica la información de un juego
     * @param juego El juego con la información a modificar
     */
    public void modificarJuego(Juego juego) throws SQLException {
        
    }
}
