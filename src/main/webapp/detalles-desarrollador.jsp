<%@page import="java.util.ArrayList"%>
<%@page import="com.sanvalero.easteregg.domain.Juego"%>
<%@page import="com.sanvalero.easteregg.dao.JuegoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css2?family=Bangers&family=Chakra+Petch:wght@300&family=Permanent+Marker&family=Press+Start+2P&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">      
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link rel="icon" type="image/png" href="images/moneda.gif" /><!--enlace para icono de la pestaña-->
        <title>Listado de desarrolladores</title>         
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
        <%
            String nombre = request.getParameter("nombre");
            String email = request.getParameter("email");
            String pais = request.getParameter("pais");
        %>
            <div class="listaJ" id="lj">

                    <div class="lineblack"></div>
                        <h1 id="h1L"><%=nombre%></h1>
                    <div class="lineblack"></div>

            <h3>Email: <%= email%></h3>

            <h3>Ubicación:  <%= pais%></h3>
            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d11923.607449786583!2d-0.8655470877441416!3d41.65786232505719!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses!2ses!4v1618509374361!5m2!1ses!2ses" bottom="0" width="100%" height="400" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
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
