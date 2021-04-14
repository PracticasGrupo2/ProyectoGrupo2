package com.sanvalero.easteregg.dao;

import com.sanvalero.easteregg.domain.Desarrollador;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DesarrolladorDAO {

    private Conexion conexion;

    public DesarrolladorDAO() {
        conexion = new Conexion();
    }
    
    /**
     * Genera automáticamente una id nueva para registrar un juego
     * @throws SQLException 
     */
    public int getNewId() throws SQLException {
        
        String consulta = "SELECT MAX(ID_DESARROLLADOR) FROM DESARROLLADORES";
        
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(consulta);
        ResultSet resultado = sentencia.executeQuery();
        resultado.next();
        int idDesarrollador = resultado.getInt(1);
        
        return idDesarrollador + 1;
    }
    
    /**
     * Busca la ID del desarrollador buscándolo por nombre
     * @param desarrollador
     * @return Devuelve la ID del desarrollador de la base de datos
     * @throws SQLException 
     */
    public int getId(String desarrollador) throws SQLException {
        
        String consulta = "SELECT ID_DESARROLLADOR FROM DESARROLLADORES WHERE NOMBRE_DESARROLLADOR = ?";
        
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(consulta);
        sentencia.setString(1, desarrollador);
        ResultSet resultado = sentencia.executeQuery();
        resultado.next();
        int idDesarrollador = resultado.getInt(1);
        
        return idDesarrollador;
    }
    
    public void registrarDesarrollador(Desarrollador desarrollador) throws SQLException {
        
        String consulta = "INSERT INTO DESARROLLADORES VALUES(?, ?, ?, ?)";
        
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(consulta);
        sentencia.setInt(1, desarrollador.getIdDesarrollador());
        sentencia.setString(2, desarrollador.getNombreDesarrollador());
        sentencia.setString(3, desarrollador.getEmailDesarrollador());
        sentencia.setString(4, desarrollador.getUbicacion());
        sentencia.executeUpdate();
    }
}
