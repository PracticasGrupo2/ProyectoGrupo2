<%@page import="java.util.ArrayList"%>
<%@page import="com.sanvalero.netflix.domain.Juego"%>
<%@page import="com.sanvalero.netflix.dao.JuegoDAO"%>
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
        <li><%= juego.getTituloJuego()%> <a href="eliminar-juego?id=<%= juego.getIdJuego()%>">Eliminar</a></li>
        <%    
            }
        %>
        </ul>
        <!-- FIXME juego de ejemplo (eliminar cuando se desarrolle el listado) -->
        <li>Título de ejemplo <a href="eliminar-juego?id=45">Eliminar</a></li>
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
