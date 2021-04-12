package com.sanvalero.easteregg.servlet;

import com.sanvalero.easteregg.dao.JuegoDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet que elimina una película a la base de datos
 */
@WebServlet(name = "eliminar-juego", urlPatterns = {"/eliminar-juego"})
public class EliminarJuegoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        int idJuego = Integer.parseInt(request.getParameter("id"));
        JuegoDAO juegoDAO = new JuegoDAO();
        juegoDAO.eliminarJuego(idJuego);
        
        response.sendRedirect("juegos?message=Juego eliminada");
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
