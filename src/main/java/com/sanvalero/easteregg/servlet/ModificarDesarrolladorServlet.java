package com.sanvalero.easteregg.servlet;

import com.sanvalero.easteregg.dao.DesarrolladorDAO;
import com.sanvalero.easteregg.domain.Desarrollador;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet que modifica un desarrollador de la base de datos
 */
@WebServlet(name = "modificar-desarrollador", urlPatterns = {"/modificar-desarrollador"})
public class ModificarDesarrolladorServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        
        DesarrolladorDAO desarrolladorDAO = new DesarrolladorDAO();
        
        int idDesarrollador = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String ubicacion = request.getParameter("ubicacion");
        
        
        Desarrollador desarrollador = new Desarrollador(idDesarrollador, nombre, email, ubicacion);
        
        try {
            desarrolladorDAO.modificarDesarrollador(desarrollador);
            PrintWriter out = response.getWriter();
            response.sendRedirect("modificarDesarrollador.jsp?status=ok");
        } catch (SQLException sqle) {
            response.sendRedirect("modificarDesarrollador.jsp?status=error");
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