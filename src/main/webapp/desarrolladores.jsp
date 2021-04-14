<%@page import="com.sanvalero.easteregg.domain.Desarrollador"%>
<%@page import="com.sanvalero.easteregg.dao.DesarrolladorDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css2?family=Bangers&family=Chakra+Petch:wght@300&family=Permanent+Marker&family=Press+Start+2P&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">      
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>Listado de juegos</title>         
    </head>
    <body>
                <!-- Side navigation -->
        <div class="navIzq">
          <a href="#">OPCIONES</a>
          <br>
          <a href="juegos">Ver lista</a>
          <a href="#">Detalle</a>
          <a href="#">Borrar</a>
          <a href="myform.jsp">Registrar</a>         
        </div>

        <!-- Page content -->
        <div class="bodyM">    
        
        <h1>Lista de desarrolladores (con JSP)</h1>
        <%
            DesarrolladorDAO desarrolladorDAO = new DesarrolladorDAO();
            ArrayList<Desarrollador> desarrolladores = desarrolladorDAO.getDesarrolladores();
        %>
        <ul>
        <%
            for (Desarrollador desarrollador : desarrolladores) {
        %>
        <li><%= desarrollador.getNombreDesarrollador()%>
            <a href="modificarDesarrollador.jsp?id=<%= desarrollador.getIdDesarrollador()%>&nombre=<%=desarrollador.getNombreDesarrollador()%>&email=<%=desarrollador.getEmailDesarrollador()%>&ubicacion=<%=desarrollador.getUbicacion()%>">Modificar</a></li><a href="eliminar-desarrollador?id=<%= desarrollador.getIdDesarrollador()%>">Eliminar</a></li>
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
        
        </div><!--<!-- fin class="main" -->
    </body>
</html>
