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
     * Genera automáticamente una id nueva para registrar un desarrollador
     *
     * @return Devuelve un incremento del id del desarrollador
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
     *
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

    /**
     * Obtiene la lista de desarrolladores de la base de datos
     *
     * @return Devuelve una colección con los juegos
     * @throws SQLException
     */
    public ArrayList<Desarrollador> getDesarrolladores() throws SQLException {
        String consulta = "SELECT ID_DESARROLLADOR, NOMBRE_DESARROLLADOR, EMAIL, PAIS FROM DESARROLLADORES ORDER BY NOMBRE_DESARROLLADOR";

        ArrayList<Desarrollador> listadoDesarrolladores = new ArrayList<>();
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(consulta);
        ResultSet resultado = sentencia.executeQuery();

        while (resultado.next()) {
            Desarrollador desarrollador = new Desarrollador();
            desarrollador.setIdDesarrollador(resultado.getInt(1));
            desarrollador.setNombreDesarrollador(resultado.getString(2));
            desarrollador.setEmailDesarrollador(resultado.getString(3));
            desarrollador.setUbicacion(resultado.getString(4));
            listadoDesarrolladores.add(desarrollador);

        }
        return listadoDesarrolladores;
    }
    
    public String getNombreDesarrollador(int idJuego) throws SQLException {
        String consulta = "SELECT DE.NOMBRE_DESARROLLADOR FROM DESARROLLADORES DE INNER JOIN JUEGOS JU ON "
                + "DE.ID_DESARROLLADOR = JU.ID_DESARROLLADOR WHERE JU.ID_JUEGO = ?";

        PreparedStatement sentencia = conexion.getConexion().prepareStatement(consulta);
        sentencia.setInt(1, idJuego);
        ResultSet resultado = sentencia.executeQuery();

        resultado.next();
        String desarrollador = resultado.getString(1);

        return desarrollador;
    }
    
    /**
     * Obtiene el nombre del desarrollador a partir del id del juego
     * @param max
     * @param min
     * @return Devuelve una colección con los desarrolladores
     * @throws SQLException
     */
    public ArrayList<Desarrollador> getDesarrolladorPaginar(int min, int max) throws SQLException {
        String consulta = "SELECT * FROM (SELECT Q.*,ROWNUM RO FROM (SELECT ID_DESARROLLADOR, NOMBRE_DESARROLLADOR, EMAIL, PAIS FROM DESARROLLADORES ORDER BY NOMBRE_DESARROLLADOR)Q WHERE ROWNUM <="+max+") WHERE RO >="+min;

        ArrayList<Desarrollador> listadoDesarrolladores = new ArrayList<>();
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(consulta);
        ResultSet resultado = sentencia.executeQuery();

        while (resultado.next()) {
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
     * Obtiene una lista de juegos a partir del id del juego
     *
     * @param num
     * @return Devuelve una colección de juegos por id
     * @throws SQLException
     */
    public ArrayList<Desarrollador> irPagina(int num) throws SQLException {
        return getDesarrolladorPaginar(num * 6 + 1, (num + 1) * 6);
    }
    /**
     * Elimina un desarrollador
     *
     * @param int El id del desarrollador a eliminar
     * @throws SQLException
     */
    public void eliminarDesarrollador(int idDesarrollador) throws SQLException {

        String consulta = "DELETE FROM DESARROLLADORES WHERE ID_DESARROLLADOR = ?";
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(consulta);

        sentencia.setInt(1, idDesarrollador);
        sentencia.executeUpdate();
    }

    /**
     * Registra un desarrollador por nombre
     *
     * @param desarrollador
     * @throws SQLException
     */
    
    
    public void registrarDesarrollador(Desarrollador desarrollador) throws SQLException {

        String consulta = "INSERT INTO DESARROLLADORES VALUES(?, ?, ?, ?)";

        PreparedStatement sentencia = conexion.getConexion().prepareStatement(consulta);
        sentencia.setInt(1, desarrollador.getIdDesarrollador());
        sentencia.setString(2, desarrollador.getNombreDesarrollador());
        sentencia.setString(3, desarrollador.getEmailDesarrollador());
        sentencia.setString(4, desarrollador.getUbicacion());
        sentencia.executeUpdate();
    }

    /**
     * Modificar un desarrollador por nombre
     *
     * @param desarrollador
     * @throws SQLException
     */
    public void modificarDesarrollador(Desarrollador desarrollador) throws SQLException {
        String consulta = "UPDATE DESARROLLADORES SET NOMBRE_DESARROLLADOR = ?, EMAIL = ?, PAIS = ? WHERE ID_DESARROLLADOR = ?";

        PreparedStatement sentencia = conexion.getConexion().prepareStatement(consulta);
        sentencia.setString(1, desarrollador.getNombreDesarrollador());
        sentencia.setString(2, desarrollador.getEmailDesarrollador());
        sentencia.setString(3, desarrollador.getUbicacion());
        sentencia.setInt(4, desarrollador.getIdDesarrollador());
        sentencia.executeUpdate();
    }
}
