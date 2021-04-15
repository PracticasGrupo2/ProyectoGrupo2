package com.sanvalero.easteregg.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    private final String DRIVER = "oracle.jdbc.driver.OracleDriver";
    private final String URL_CONEXION = "jdbc:oracle:thin:@//localhost:1521/xe";
    private final String USUARIO = "EASTEREGG";
    private final String CONTRASENA = "1234";

    private Connection conexion;

    public Conexion() {
        conectar();
    }

    public Connection getConexion() {
        return conexion;
    }

    /**
     * Conecta con la base de datos
     */
    public void conectar() {
        try {
            Class.forName(DRIVER);
            conexion = DriverManager.getConnection(URL_CONEXION, USUARIO, CONTRASENA);
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }

    /**
     * Desconecta de la base de datos
     */
    public void desconectar() {
        try {
            conexion.close();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }
}
