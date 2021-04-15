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
     * Genera automáticamente una id nueva para registrar un juego
     *
     * @throws SQLException
     */
    public int getNewId() throws SQLException {

        String consulta = "SELECT MAX(ID_JUEGO) FROM JUEGOS";

        PreparedStatement sentencia = conexion.getConexion().prepareStatement(consulta);
        ResultSet resultado = sentencia.executeQuery();
        resultado.next();
        int idJuego = resultado.getInt(1);

        return idJuego + 1;
    }

    /**
     * Añade un juego a la base de datos
     *
     * @param juego El juego con la información que se quiere registrar
     * @throws SQLException
     */
    public void registrarJuego(Juego juego) throws SQLException {

        String consulta = "INSERT INTO JUEGOS VALUES(?, ?, ?, ?, ?)";

        PreparedStatement sentencia = conexion.getConexion().prepareStatement(consulta);
        sentencia.setInt(1, juego.getIdJuego());
        sentencia.setInt(2, juego.getIdDesarrollador());
        sentencia.setInt(3, juego.getIdGenero());
        sentencia.setString(4, juego.getTituloJuego());
        sentencia.setString(5, juego.getDescripcionJuego());
        sentencia.executeUpdate();
    }

    /**
     * Obtiene la lista de juegos de la base de datos ordenados por titulo
     *
     * @return Una colección de juegos
     * @throws SQLException
     */
    public ArrayList<Juego> getJuegos() throws SQLException {
        String consulta = "SELECT ID_JUEGO, TITULO, DESCRIPCION FROM JUEGOS ORDER BY TITULO";

        ArrayList<Juego> listadoJuegos = new ArrayList<>();
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(consulta);
        ResultSet resultado = sentencia.executeQuery();

        while (resultado.next()) {
            Juego juego = new Juego();
            juego.setIdJuego(resultado.getInt(1));
            juego.setTituloJuego(resultado.getString(2));
            juego.setDescripcionJuego(resultado.getString(3));
            listadoJuegos.add(juego);

        }
        return listadoJuegos;

    }

    /**
     * Obtiene la lista de juegos de la base de datos ordenados por titulo
     *
     * @return Una colección de juegos
     * @throws SQLException
     */
    public ArrayList<Juego> getJuegosPaginar(int min, int max) throws SQLException {
        String consulta = "SELECT * FROM (SELECT Q.*,ROWNUM RO FROM (SELECT ID_JUEGO, TITULO, DESCRIPCION FROM JUEGOS ORDER BY ID_JUEGO)Q WHERE ROWNUM <="+max+") WHERE RO >="+min;

        ArrayList<Juego> listadoJuegos = new ArrayList<>();
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(consulta);
        ResultSet resultado = sentencia.executeQuery();

        while (resultado.next()) {
            Juego juego = new Juego();
            juego.setIdJuego(resultado.getInt(1));
            juego.setTituloJuego(resultado.getString(2));
            juego.setDescripcionJuego(resultado.getString(3));
            listadoJuegos.add(juego);

        }
        return listadoJuegos;

    }
    
    /**
     * Obtiene la lista de juegos de la base de datos ordenados por titulo
     * @param max numero de juego maximo
     * @param min numero de juego minimo
     * @return Una colección de juegos
     * @throws SQLException
     */
    public ArrayList<Juego> getJuegosPaginar(int min, int max) throws SQLException {
        String consulta = "SELECT * FROM (SELECT Q.*,ROWNUM RO FROM (SELECT ID_JUEGO, TITULO, DESCRIPCION FROM JUEGOS ORDER BY ID_JUEGO)Q WHERE ROWNUM <="+max+") WHERE RO >="+min;

        ArrayList<Juego> listadoJuegos = new ArrayList<>();
        PreparedStatement sentencia = conexion.getConexion().prepareStatement(consulta);
        ResultSet resultado = sentencia.executeQuery();

        while (resultado.next()) {
            Juego juego = new Juego();
            juego.setIdJuego(resultado.getInt(1));
            juego.setTituloJuego(resultado.getString(2));
            juego.setDescripcionJuego(resultado.getString(3));
            listadoJuegos.add(juego);

        }
        return listadoJuegos;
    }
    /**
     * Obtiene una lista de juegos a partir del id del juego
     *
     * @param num
     * @return Devuelve una colección de juegos por id
     * @throws SQLException
     */
    public ArrayList<Juego> irPagina(int num) throws SQLException {
        return getJuegosPaginar(num * 6 + 1, (num + 1) * 6);
    }

    /**
     * Elimina un juego
     *
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
     *
     * @param juego El juego con la información a modificar
     */
    public void modificarJuego(Juego juego) throws SQLException {
        String consulta = "UPDATE JUEGOS SET TITULO = ?, DESCRIPCION = ? WHERE ID_JUEGO = ?";

        PreparedStatement sentencia = conexion.getConexion().prepareStatement(consulta);
        sentencia.setString(1, juego.getTituloJuego());
        sentencia.setString(2, juego.getDescripcionJuego());
        sentencia.setInt(3, juego.getIdJuego());
        sentencia.executeUpdate();
    }

    /**
     * Busca un juego dentro de la base de datos, por titulo
     *
     * @param tituloJuego
     * @return Devuelve una colección de juegos a partir de la busqueda
     * realizada
     * @throws SQLException
     */
    public ArrayList<Juego> buscarJuego(String tituloJuego) throws SQLException {

        String consulta = "SELECT ID_JUEGO, TITULO, DESCRIPCION FROM JUEGOS WHERE UPPER(TITULO) LIKE  UPPER('%" + tituloJuego + "%')";
        
        ArrayList<Juego> listadoJuegos = new ArrayList<>();

        PreparedStatement sentencia = conexion.getConexion().prepareStatement(consulta);
        ResultSet resultado = sentencia.executeQuery();

        while (resultado.next()) {
            Juego juego = new Juego();
            juego.setIdJuego(resultado.getInt(1));
            juego.setTituloJuego(resultado.getString(2));
            juego.setDescripcionJuego(resultado.getString(3));
            listadoJuegos.add(juego);
        }
        return listadoJuegos;
    }

}
