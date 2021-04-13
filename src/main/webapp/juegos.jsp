<%@page import="java.util.ArrayList"%>
<%@page import="com.sanvalero.easteregg.domain.Juego"%>
<%@page import="com.sanvalero.easteregg.dao.JuegoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de juegos</title>
    </head>
    <body>
        <h1>Lista de juegos (con JSP)</h1>
        <%
            JuegoDAO juegoDAO = new JuegoDAO();
            ArrayList<Juego> juegos = juegoDAO.getJuegos();
        %>
        <ul>
        <%
            for (Juego juego : juegos) {
        %>
        <li><%= juego.getTituloJuego()%> <a href="eliminar-juegos?id=<%= juego.getIdJuego()%>">Eliminar</a></li>
        <%    
            }
        %>
        </ul>
        
        <%
            // Muestra el mensaje (si lo hay)
            String message = request.getParameter("message");
            if (message != null) {
        %>
            <p style='color:green'><%= message %></p>
        <%        
            }
        %>
    </body>
</html>
