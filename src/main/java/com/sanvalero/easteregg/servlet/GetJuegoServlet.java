package com.sanvalero.easteregg.servlet;

import com.sanvalero.easteregg.dao.JuegoDAO;
import com.sanvalero.easteregg.domain.Juego;
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
 * Servlet que obtiene la lista completa de juegos de la base de datos
 */
@WebServlet(name = "juegos", urlPatterns = {"/juegos"})
public class GetJuegoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.println("<p>Listado de juegos (con servlet)</p>");
        JuegoDAO juegoDAO = new JuegoDAO();
        try {
            ArrayList<Juego> juegos = juegoDAO.getJuegos();
            out.println("<ul>");
            for (Juego juego : juegos) {
                out.println("<li>" + juego.getTituloJuego()+ " <a href='eliminar-juegos?id=" + juego.getIdJuego()+ "'>Eliminar</a></li>");
            }
            // FIXME juego de ejemplo (eliminar cuando se desarrolle el listado)
            out.println("<li>Juego de ejemplo</li> <a href='eliminar-juego?id=23'>Eliminar</a></li>");
            out.println("</ul>");

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
