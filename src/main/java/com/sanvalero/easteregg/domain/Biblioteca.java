package com.sanvalero.easteregg.domain;

public class Biblioteca {

    private int idUsuario;
    private int idJuego;
    private String fechaCompra;
    private int tiempoJuego;

    public Biblioteca(int idUsuario, int idJuego, String fechaCompra, int tiempoJuego) {
        this.idUsuario = idUsuario;
        this.idJuego = idJuego;
        this.fechaCompra = fechaCompra;
        this.tiempoJuego = tiempoJuego;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdJuego() {
        return idJuego;
    }

    public void setIdJuego(int idJuego) {
        this.idJuego = idJuego;
    }

    public String getFechaCompra() {
        return fechaCompra;
    }

    public void setFechaCompra(String fechaCompra) {
        this.fechaCompra = fechaCompra;
    }

    public int getTiempoJuego() {
        return tiempoJuego;
    }

    public void setTiempoJuego(int tiempoJuego) {
        this.tiempoJuego = tiempoJuego;
    }
    
    
}
