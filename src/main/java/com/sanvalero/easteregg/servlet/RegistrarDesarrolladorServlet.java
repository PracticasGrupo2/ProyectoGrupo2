package com.sanvalero.easteregg.servlet;

import com.sanvalero.easteregg.dao.DesarrolladorDAO;
import com.sanvalero.easteregg.domain.Desarrollador;
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
 * Servlet que añade un desarrollador a la base de datos
 */
@WebServlet(name = "registrar-desarrollador", urlPatterns = {"/registrar-desarrollador"})
public class RegistrarDesarrolladorServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        
        DesarrolladorDAO desarrolladorDAO = new DesarrolladorDAO();
        
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String pais = request.getParameter("pais");
        
        int idDesarrollador = 0;
        
        try {
            idDesarrollador = desarrolladorDAO.getNewId();
        } catch (SQLException ex) {
            Logger.getLogger(RegistrarJuegoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        Desarrollador desarrollador = new Desarrollador(idDesarrollador, nombre, email, pais);
        
        PrintWriter out = response.getWriter();
        try {
            desarrolladorDAO.registrarDesarrollador(desarrollador);
            
                out.write("Desarrollador registrado con &eacute;xito");
        } catch (SQLException sqle) {
            out.write("Este desarrollador no se ha podido registrar");
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
