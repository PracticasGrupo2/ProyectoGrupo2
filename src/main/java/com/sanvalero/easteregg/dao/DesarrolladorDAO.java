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
