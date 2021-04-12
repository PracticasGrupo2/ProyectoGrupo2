package com.sanvalero.easteregg.domain;

public class Genero {

    private int idGenero;
    private String nombreGenero;
    private String descripcionGenero;
    private String subgenero;

    public Genero(int idGenero, String nombreGenero, String descripcionGenero, String subgenero) {
        this.idGenero = idGenero;
        this.nombreGenero = nombreGenero;
        this.descripcionGenero = descripcionGenero;
        this.subgenero = subgenero;
    }

    public int getIdGenero() {
        return idGenero;
    }

    public void setIdGenero(int idGenero) {
        this.idGenero = idGenero;
    }

    public String getNombreGenero() {
        return nombreGenero;
    }

    public void setNombreGenero(String nombreGenero) {
        this.nombreGenero = nombreGenero;
    }

    public String getDescripcionGenero() {
        return descripcionGenero;
    }

    public void setDescripcionGenero(String descripcionGenero) {
        this.descripcionGenero = descripcionGenero;
    }

    public String getSubgenero() {
        return subgenero;
    }

    public void setSubgenero(String subgenero) {
        this.subgenero = subgenero;
    }
}
