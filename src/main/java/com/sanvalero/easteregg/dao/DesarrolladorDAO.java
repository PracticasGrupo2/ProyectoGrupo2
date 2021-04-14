package com.sanvalero.easteregg.dao;

import com.sanvalero.easteregg.domain.Desarrollador;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
    
       public ArrayList<Desarrollador> getDesarrolladores() throws SQLException {  
        String consulta = "SELECT ID_DESARROLLADOR, NOMBRE_DESARROLLADOR, EMAIL, PAIS FROM DESARROLLADORES";
        
        ArrayList<Desarrollador> listadoDesarrolladores = new ArrayList<>();
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(consulta);
        ResultSet resultado = sentencia.executeQuery();
        
        while(resultado.next()){
            Desarrollador desarrollador = new Desarrollador();
            desarrollador.setIdDesarrollador(resultado.getInt(1));
            desarrollador.setNombreDesarrollador(resultado.getString(2));
            desarrollador.setEmailDesarrollador(resultado.getString(3));
            desarrollador.setUbicacion(resultado.getString(4));
            listadoDesarrolladores.add(desarrollador);
           
        }
        return listadoDesarrolladores;   
    }
    
       /**
     * Elimina un desarrollador
     * @param idJuego El id del desarrollador a eliminar
     */
    public void eliminarDesarrollador(int idDesarrollador) throws SQLException {
        
        
        String consulta = "DELETE FROM DESARROLLADORES WHERE ID_DESARROLLADOR = ?";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(consulta);
        
        sentencia.setInt(1, idDesarrollador);
        sentencia.executeUpdate();
    }
}
