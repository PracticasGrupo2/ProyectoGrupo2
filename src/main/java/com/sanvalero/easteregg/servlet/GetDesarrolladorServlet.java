package com.sanvalero.easteregg.servlet;

import com.sanvalero.easteregg.dao.DesarrolladorDAO;
import com.sanvalero.easteregg.domain.Desarrollador;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet que obtiene la lista completa de desarrolladores de la base de datos
 */
@WebServlet(name = "desarrolladores", urlPatterns = {"/desarrolladores"})
public class GetDesarrolladorServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.println("<p>Listado de desarrolladores (con servlet)</p>");
        DesarrolladorDAO desarrolladorDAO = new DesarrolladorDAO();
        try {
            ArrayList<Desarrollador> desarrolladores = desarrolladorDAO.getDesarrolladores();
            out.println("<ul>");
            for (Desarrollador desarrollador : desarrolladores) {
                out.println("<li>" + desarrollador.getNombreDesarrollador() + " <a href='eliminar-desarrolladores?id=" + desarrollador.getIdDesarrollador() + "'>Eliminar</a></li>");
            }

            // Muestra el mensaje (si lo hay)
            String message = request.getParameter("message");
            if (!message.equals("")) {
                out.println("<p style='color:green'>" + message + "</p>");
            }
        } catch (SQLException sqle) {
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
