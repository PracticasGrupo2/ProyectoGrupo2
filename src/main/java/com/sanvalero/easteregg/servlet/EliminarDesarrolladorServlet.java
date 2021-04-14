package com.sanvalero.easteregg.servlet;

import com.sanvalero.easteregg.dao.DesarrolladorDAO;
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
 * Servlet que elimina una desarrolladora a la base de datos
 */
@WebServlet(name = "eliminar-desarrollador", urlPatterns = {"/eliminar-desarrollador"})
public class EliminarDesarrolladorServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        
        int idDesarrollador = Integer.parseInt(request.getParameter("id"));
        DesarrolladorDAO desarrolladorDAO = new DesarrolladorDAO();
        
        try {
            desarrolladorDAO.eliminarDesarrollador(idDesarrollador);
            response.sendRedirect("desarrolladores.jsp?message=Desarrollador eliminado");
        } catch (SQLException sqle) {
            Logger.getLogger(EliminarDesarrolladorServlet.class.getName()).log(Level.SEVERE, null, sqle);
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
