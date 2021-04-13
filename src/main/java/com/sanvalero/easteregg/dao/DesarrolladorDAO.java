package com.sanvalero.easteregg.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DesarrolladorDAO {

    private Conexion conexion;

    public DesarrolladorDAO() {
        conexion = new Conexion();
    }
    
    public int getId(String desarrollador) throws SQLException {
        
        String consulta = "SELECT ID_DESARROLLADOR FROM DESARROLLADORES WHERE NOMBRE_DESARROLLADOR = ?";
        
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(consulta);
        sentencia.setString(1, desarrollador);
        ResultSet resultado = sentencia.executeQuery();
        resultado.next();
        int idDesarrollador = resultado.getInt(1);
        
        return idDesarrollador;
    }
}
