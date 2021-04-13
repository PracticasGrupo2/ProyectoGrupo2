package com.sanvalero.easteregg.domain;

/**
 * Un videojuego
 */
public class Juego {
    
    private int idJuego;
    private int idDesarrollador;
    private int idGenero;
    private String tituloJuego;
    private String descripcionJuego;

    public Juego() {
    }

    public Juego(int idJuego, String tituloJuego, String descripcionJuego) {
        this.idJuego = idJuego;
        this.tituloJuego = tituloJuego;
        this.descripcionJuego = descripcionJuego;
    }
  

    public Juego(int idJuego, int idDesarrollador, int idGenero, String tituloJuego, String descripcionJuego) {
        this.idJuego = idJuego;
        this.idDesarrollador = idDesarrollador;
        this.idGenero = idGenero;
        this.tituloJuego = tituloJuego;
        this.descripcionJuego = descripcionJuego;
    }

    public Juego(String tituloJuego, String descripcionJuego) {
        this.tituloJuego = tituloJuego;
        this.descripcionJuego = descripcionJuego;
    }

    public int getIdJuego() {
        return idJuego;
    }

    public void setIdJuego(int idJuego) {
        this.idJuego = idJuego;
    }

    public int getIdDesarrollador() {
        return idDesarrollador;
    }

    public void setIdDesarrollador(int idDesarrollador) {
        this.idDesarrollador = idDesarrollador;
    }

    public int getIdGenero() {
        return idGenero;
    }

    public void setIdGenero(int idGenero) {
        this.idGenero = idGenero;
    }

    public String getTituloJuego() {
        return tituloJuego;
    }

    public void setTituloJuego(String tituloJuego) {
        this.tituloJuego = tituloJuego;
    }

    public String getDescripcionJuego() {
        return descripcionJuego;
    }

    public void setDescripcionJuego(String descripcionJuego) {
        this.descripcionJuego = descripcionJuego;
    }
    
}
