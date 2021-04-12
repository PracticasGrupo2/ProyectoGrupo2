package com.sanvalero.easteregg.domain;

public class Desarrollador {

    private int idDesarrollador;
    private String nombreDesarrollador;
    private String emailDesarrollador;
    private String ubicacion;

    public Desarrollador(int idDesarrollador, String nombreDesarrollador, String emailDesarrollador, String ubicacion) {
        this.idDesarrollador = idDesarrollador;
        this.nombreDesarrollador = nombreDesarrollador;
        this.emailDesarrollador = emailDesarrollador;
        this.ubicacion = ubicacion;
    }

    public int getIdDesarrollador() {
        return idDesarrollador;
    }

    public void setIdDesarrollador(int idDesarrollador) {
        this.idDesarrollador = idDesarrollador;
    }

    public String getNombreDesarrollador() {
        return nombreDesarrollador;
    }

    public void setNombreDesarrollador(String nombreDesarrollador) {
        this.nombreDesarrollador = nombreDesarrollador;
    }

    public String getEmailDesarrollador() {
        return emailDesarrollador;
    }

    public void setEmailDesarrollador(String emailDesarrollador) {
        this.emailDesarrollador = emailDesarrollador;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }
}
