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
        <link rel="icon" type="image/png" href="images/moneda.gif" /><!--enlace para icono de la pestaña-->
        <title>Desarrolladores</title>                         
    </head>
    <body>
                <!-- Side navigation -->
        <div class="navIzq">
          <a id="esp" href="#">OPCIONES</a>
          <br>
          <a href="buscarJuego.jsp">Buscar</a> 
          <a href="juegos.jsp">Ver Juegos</a>
          <a href="desarrolladores.jsp">Ver Desarrolladores</a>
          <a href="registrarJuego.jsp">Registrar Juegos</a>
          <a href="registrarDesarrollador.jsp">Registrar Desarrolladores</a> 
          <a href="novedades.html">Novedades</a>       
        </div>

        <!-- Page content -->
        <div class="bodyM">    
        
            <div class="listaJ" id="lj">
                
                <div class="lineblack"></div>
                <h1 id="h1L">Lista de desarrolladores</h1>
                <div class="lineblack"></div>
        
        <%
            DesarrolladorDAO desarrolladorDAO = new DesarrolladorDAO();
            ArrayList<Desarrollador> desarrolladores = desarrolladorDAO.getDesarrolladores();
        %>
        <ul>
        <%
            for (Desarrollador desarrollador : desarrolladores) {
        %>
        <li><div id="tG" ><a href="detalles-desarrollador.jsp?nombre=<%= desarrollador.getNombreDesarrollador()%>&email=<%= desarrollador.getEmailDesarrollador()%>&pais=<%= desarrollador.getUbicacion()%>"><%= desarrollador.getNombreDesarrollador()%></a></div>
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
            </div>
        
        </div><!--<!-- fin class="main" -->
    </body>
</html>
