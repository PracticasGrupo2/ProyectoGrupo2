package com.sanvalero.easteregg.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GeneroDAO {

    private Conexion conexion;

    public GeneroDAO() {
        conexion = new Conexion();
    }
    
    public int getId(String genero) throws SQLException {
        
        String consulta = "SELECT ID_GENERO FROM GENEROS WHERE NOMBRE_GENERO = ?";
        
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(consulta);
        sentencia.setString(1, genero);
        ResultSet resultado = sentencia.executeQuery();
        resultado.next();
        int idGenero = resultado.getInt(1);
        
        return idGenero;
    }
}
