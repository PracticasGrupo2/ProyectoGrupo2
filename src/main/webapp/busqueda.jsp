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
        <title>Listado de juegos</title>         
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
                <h1 id="h1L">Lista de juegos (con JSP)</h1>
                <div class="lineblack"></div>
        
                <%
                    JuegoDAO juegoDAO = new JuegoDAO();
                    String titulo = request.getParameter("nombre");
                    ArrayList<Juego> juegos = juegoDAO.buscarJuego(titulo);    
                %>
                <ul>
                <%
                    for (Juego juego : juegos) {
                %>
                <li><div id="tG"><%= juego.getTituloJuego()%></div></li>
                <%    
                    }
                %>
                </ul>
            </div>
        
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