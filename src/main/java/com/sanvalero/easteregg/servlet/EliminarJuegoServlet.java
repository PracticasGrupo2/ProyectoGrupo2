package com.sanvalero.easteregg.servlet;

import com.sanvalero.easteregg.dao.JuegoDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet que elimina un juego de la base de datos
 */
@WebServlet(name = "eliminar-juegos", urlPatterns = {"/eliminar-juegos"})
public class EliminarJuegoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {

        int idJuego = Integer.parseInt(request.getParameter("id"));
        String redireccion = request.getParameter("url");
        int pagina = Integer.parseInt(request.getParameter("page"));
        
        JuegoDAO juegoDAO = new JuegoDAO();

        try {
            juegoDAO.eliminarJuego(idJuego);
            if (redireccion.length() == 2){
                response.sendRedirect("busqueda.jsp?message=Game deleted");
            } else {
                response.sendRedirect("juegos.jsp?page=" + pagina + "&message=Game deleted");
            }
        } catch (SQLException sqle) {
            Logger.getLogger(EliminarJuegoServlet.class.getName()).log(Level.SEVERE, null, sqle);
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
