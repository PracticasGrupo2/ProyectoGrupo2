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
        <title>Developers</title>   
    </head>
    <body>
        <!-- menu -->
        <div class="navIzq">
          <a id="esp" href="#">OPTIONS</a>
          <br>
          <a href="buscarJuego.jsp">Search</a> 
          <a href="juegos.jsp?page=0">Games</a>
          <a href="desarrolladores.jsp?page=0">Developers</a>
          <a href="registrarJuego.jsp">Register a game</a>
          <a href="registrarDesarrollador.jsp">Register a developer</a>  
          <a href="novedades.html">News</a>         
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
            <div class="lineblack"></div>
                <h1 id="tit">Developer list</h1>
                <div class="lineblack"></div>
                <%
                    DesarrolladorDAO desarrolladorDAO = new DesarrolladorDAO();
                    int pagina = (Integer.parseInt(request.getParameter("page")))|0;
                    ArrayList<Desarrollador> desarrolladores = desarrolladorDAO.irPagina(pagina);
                    double numDesarrolladores = desarrolladorDAO.getNumDesarrolladores();

                %>
                <div class="pagi">
                    <%if(pagina > 0) {%>
                        <a href="/easteregg/desarrolladores.jsp?page=<%=pagina-1%>">
                        < Back
                        </a>
                    <%}%>
                    <%if(numDesarrolladores > 6) {%>
                        ...
                    <%}%>
                    <%if (pagina < numDesarrolladores / 6 - 1) {%>
                        <a href="/easteregg/desarrolladores.jsp?page=<%=pagina+1%>">
                        Next >
                        </a>
                    <%}%>
                </div>
                    <div class="pagi" style="position: fixed; bottom: 0px; padding-right: 9.3%;">
                    <%if(pagina > 0) {%>
                        <a href="/easteregg/desarrolladores.jsp?page=<%=pagina-1%>">
                        < Back
                        </a>
                    <%}%>
                    <%if(numDesarrolladores > 6) {%>
                        ...
                    <%}%>
                    <%if (pagina < numDesarrolladores / 6 - 1) {%>
                        <a href="/easteregg/desarrolladores.jsp?page=<%=pagina+1%>">
                        Next >
                        </a>
                    <%}%>
                </div>
            <div class="listaJ" id="lj">   
                <ul id="put0">
                    <li id="put1"><img src="images/des1.jpg" alt="alt" /><img src="images/des2.jpg" alt="alt" /></li>
                    <li id="put1"><img src="images/des3.jpg" alt="alt" /><img src="images/des4.jpg" alt="alt" /></li>
                    <li id="put1"><img src="images/des5.jpg" alt="alt" /><img src="images/des6.jpg" alt="alt" /></li>
                    <li id="put1"><img src="images/des7.jpg" alt="alt" /><img src="images/des8.jpg" alt="alt" /></li>
                    <li id="put1"><img src="images/des9.jpg" alt="alt" /><img src="images/des1.jpg" alt="alt" /></li>
                    <li id="put1"><img src="images/des3.jpg" alt="alt" /><img src="images/des10.jpg" alt="alt" /></li>
                </ul> 
                       
                <ul id="put0">
                <%
                    // Muestra el mensaje (si lo hay)
                    String message = request.getParameter("message");
                    if (message != null) {
                %>
                    <p style='color:green'><%= message %></p>
                <%        
                    }
                %>
                <%
                    for (Desarrollador desarrollador : desarrolladores) {
                %>
                <li id="put1" ><div id="tG" ><a href="detalles-desarrollador.jsp?nombre=<%= desarrollador.getNombreDesarrollador()%>&email=<%= desarrollador.getEmailDesarrollador()%>&pais=<%= desarrollador.getUbicacion()%>"><%= desarrollador.getNombreDesarrollador()%></a></div>
                <a href="modificarDesarrollador.jsp?id=<%= desarrollador.getIdDesarrollador()%>&nombre=<%=desarrollador.getNombreDesarrollador()%>&email=<%=desarrollador.getEmailDesarrollador()%>&ubicacion=<%=desarrollador.getUbicacion()%>">Modify</a></li>
                <a href="eliminar-desarrollador?page=<%=pagina%>&id=<%= desarrollador.getIdDesarrollador()%>">Delete</a></li>
                <br><br>
                <div class="lineblack"></div>
                <br>
                <%    
                    }
                %>
                </ul>                
                <ul id="put0">
                    <li id="put1"><img src="images/des1.jpg" alt="alt" /><img src="images/des2.jpg" alt="alt" /></li>
                    <li id="put1"><img src="images/des3.jpg" alt="alt" /><img src="images/des4.jpg" alt="alt" /></li>
                    <li id="put1"><img src="images/des5.jpg" alt="alt" /><img src="images/des6.jpg" alt="alt" /></li>
                    <li id="put1"><img src="images/des7.jpg" alt="alt" /><img src="images/des8.jpg" alt="alt" /></li>
                    <li id="put1"><img src="images/des9.jpg" alt="alt" /><img src="images/des1.jpg" alt="alt" /></li>
                    <li id="put1"><img src="images/des3.jpg" alt="alt" /><img src="images/des10.jpg" alt="alt" /></li>
                </ul> 
            </div>        
        </div><!--<!-- fin class="bodyM" -->
    </body>
</html>
