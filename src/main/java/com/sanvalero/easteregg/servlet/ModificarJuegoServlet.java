package com.sanvalero.easteregg.servlet;

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
 * Servlet que añade una película a la base de datos
 */
@WebServlet(name = "modificar-juego", urlPatterns = {"/modificar-juego"})
public class ModificarJuegoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        
        JuegoDAO juegoDAO = new JuegoDAO();
        
        int idJuego = Integer.parseInt(request.getParameter("id"));
        String tituloJuego = request.getParameter("titulo");
        String descripcionJuego = request.getParameter("descripcion");
        
        
        Juego juego = new Juego(idJuego, tituloJuego, descripcionJuego);
        
        try {
            juegoDAO.modificarJuego(juego);
            PrintWriter out = response.getWriter();
            response.sendRedirect("modificarJuego.jsp?status=ok");
        } catch (SQLException sqle) {
            response.sendRedirect("modificarJuego.jsp?status=error");
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

