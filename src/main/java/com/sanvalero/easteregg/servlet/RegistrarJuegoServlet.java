package com.sanvalero.easteregg.servlet;

import com.sanvalero.easteregg.dao.DesarrolladorDAO;
import com.sanvalero.easteregg.dao.GeneroDAO;
import com.sanvalero.easteregg.dao.JuegoDAO;
import com.sanvalero.easteregg.domain.Juego;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet que añade un juego a la base de datos
 */
@WebServlet(name = "registrar-juego", urlPatterns = {"/registrar-juego"})
public class RegistrarJuegoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        
        DesarrolladorDAO desarrolladorDAO = new DesarrolladorDAO();
        GeneroDAO generoDAO = new GeneroDAO();
        JuegoDAO juegoDAO = new JuegoDAO();
        
        String tituloJuego = request.getParameter("titulo");
        String descripcionJuego = request.getParameter("descripcion");
        String desarrollador = request.getParameter("desarrollador");
        String genero = request.getParameter("genero");
        
        int idDesarrollador = 0;
        int idGenero = 0;
        int idJuego = 0;
        
        try {
            idDesarrollador = desarrolladorDAO.getId(desarrollador);
        } catch (SQLException ex) {
            Logger.getLogger(RegistrarJuegoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            idGenero = generoDAO.getId(genero);
        } catch (SQLException ex) {
            Logger.getLogger(RegistrarJuegoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            idJuego = juegoDAO.getNewId();
        } catch (SQLException ex) {
            Logger.getLogger(RegistrarJuegoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        Juego juego = new Juego(idJuego, idDesarrollador, idGenero, tituloJuego, descripcionJuego);
        
        PrintWriter out = response.getWriter();
        try {
            juegoDAO.registrarJuego(juego);
            
            
            out.write("Juego registrado con &eacute;xito");
        } catch (SQLException sqle) {
            out.write("Este juego no se ha podido registrar");
            sqle.printStackTrace();
        }
    }
    
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
}
