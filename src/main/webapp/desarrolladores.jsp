<%@page import="com.sanvalero.easteregg.domain.Desarrollador"%>
<%@page import="com.sanvalero.easteregg.dao.DesarrolladorDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/png" href="images/moneda.gif" /><!--enlace para icono de la pestaña-->
        <!-- enlace estilo texto -->
        <link rel="stylesheet" href="css/style.css" type="text/css"><!--<!-- hoja de estilo -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Bangers&family=Chakra+Petch:wght@300&family=Permanent+Marker&family=Press+Start+2P&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"><!--enlace para iconos-->
        <title>Desarrolladores</title>   
    </head>
    <body>
        <!-- menu -->
        <div class="navIzq">
          <a id="esp" href="#">OPCIONES</a>
          <br>
          <a href="buscarJuego.jsp">Buscar</a> 
          <a href="juegos.jsp?page=0">Ver Juegos</a>
          <a href="desarrolladores.jsp">Ver Desarrolladores</a>
          <a href="registrarJuego.jsp">Registrar Juegos</a>
          <a href="registrarDesarrollador.jsp">Registrar Desarrolladores</a>  
          <a href="novedades.html">Novedades</a>         
           <!-- redes -->   
            <div class="footN">
                <a href="https://m.facebook.com/login/?locale2=es_ES" class="fa fa-facebook"></a><!--enlaces ficticios a redes de la página-->           
                <a href="https://twitter.com/login?lang=es" class="fa fa-twitter"></a>            
                <a href="https://www.instagram.com/accounts/login/?hl=es" class="fa fa-instagram"></a>            
                <a href="https://support.google.com/mail/answer/56256?hl=es" class="fa fa-envelope"></a>            
                <a href="https://novedades.orange.es" class="fa fa-phone"></a>            
            </div>
        </div>
        <!-- Contenido de la pagina -->  
        <div class="bodyM">           
            <div class="listaJ" id="lj">               
                <div class="lineblack"></div>
                <h1 id="h1L">Lista de desarrolladores</h1>
                <div class="lineblack"></div>
        <%
            DesarrolladorDAO desarrolladorDAO = new DesarrolladorDAO();
            ArrayList<Desarrollador> desarrolladores = desarrolladorDAO.getDesarrolladores();
        %>
        <ul id="put0">
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
        </div><!--<!-- fin class="bodyM" -->
    </body>
</html>
