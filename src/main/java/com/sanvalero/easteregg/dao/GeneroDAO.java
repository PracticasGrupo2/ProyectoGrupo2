package com.sanvalero.easteregg.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GeneroDAO {

    private Conexion conexion;

    public GeneroDAO() {
        conexion = new Conexion();
    }

    /**
     * Obtiene un id de genero por nombre
     *
     * @param genero
     * @return Devuelve el id del genero
     * @throws SQLException
     */
    public int getId(String genero) throws SQLException {

        String consulta = "SELECT ID_GENERO FROM GENEROS WHERE NOMBRE_GENERO = ?";

        PreparedStatement sentencia = conexion.getConexion().prepareStatement(consulta);
        sentencia.setString(1, genero);
        ResultSet resultado = sentencia.executeQuery();
        resultado.next();
        int idGenero = resultado.getInt(1);

        return idGenero;
    }

    /**
     * Obtiene el nombre del genero a partir del id del juego
     *
     * @param idJuego
     * @return Devuelve el nombre del genero
     * @throws SQLException
     */
    public String getNombreGenero(int idJuego) throws SQLException {

        String consulta = "SELECT GE.NOMBRE_GENERO FROM GENEROS GE INNER JOIN JUEGOS JU "
                + "ON GE.ID_GENERO = JU.ID_GENERO WHERE JU.ID_JUEGO = ?";

        PreparedStatement sentencia = conexion.getConexion().prepareStatement(consulta);
        sentencia.setInt(1, idJuego);
        ResultSet resultado = sentencia.executeQuery();
        resultado.next();

        String nombreGenero = resultado.getString(1);

        return nombreGenero;
    }
}
