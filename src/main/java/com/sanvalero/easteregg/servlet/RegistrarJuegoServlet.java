package com.sanvalero.easteregg.servlet;

import com.sanvalero.easteregg.dao.JuegoDAO;
import com.sanvalero.easteregg.domain.Juego;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet que añade una película a la base de datos
 */
@WebServlet(name = "registrar-juego", urlPatterns = {"/registrar-juego"})
public class RegistrarJuegoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String tituloJuego = request.getParameter("titulo");
        String descripcionJuego = request.getParameter("descripcion");
        
        Juego juego = new Juego(tituloJuego, descripcionJuego);
        JuegoDAO juegoDAO = new JuegoDAO();
        try {
            juegoDAO.registrarJuego(juego);
            
            PrintWriter out = response.getWriter();
            response.sendRedirect("myform.jsp?status=ok");
        } catch (SQLException sqle) {
            response.sendRedirect("myform.jsp?status=error");
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
