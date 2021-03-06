<%@page import="com.sanvalero.easteregg.dao.GeneroDAO"%>
<%@page import="com.sanvalero.easteregg.dao.DesarrolladorDAO"%>
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
        <title>Game list</title>         
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
                    <h1 id="tit">Search results:</h1>
                <div class="lineblack"></div>
            <div class="listaJ2" id="lj">
               
                <%
                    JuegoDAO juegoDAO = new JuegoDAO();
                    String titulo = request.getParameter("nombre");
                    ArrayList<Juego> juegos = juegoDAO.buscarJuego(titulo);
                    
                    DesarrolladorDAO desarrolladorDAO = new DesarrolladorDAO();
                    GeneroDAO generoDAO = new GeneroDAO();
                    String message = request.getParameter("message");
                %>
                <ul>
                <%
                    for (Juego juego : juegos) {
                        String desarrollador = desarrolladorDAO.getNombreDesarrollador(juego.getIdJuego());
                        String genero = generoDAO.getNombreGenero(juego.getIdJuego());
                %>
                <br><li id="put1" style="margin-right: 40px;"><div id="tG" ><a href="detalles-juego.jsp?titulo=<%= juego.getTituloJuego()%>&desarrollador=<%=desarrollador%>&genero=<%=genero%>&descripcion=<%=juego.getDescripcionJuego()%>"> <%= juego.getTituloJuego()%></a></div>
                <a href="modificarJuego.jsp?id=<%= juego.getIdJuego()%>&titulo=<%=juego.getTituloJuego()%>&descripcion=<%=juego.getDescripcionJuego()%>">Modify</a><br>
                <a href="eliminar-juegos?id=<%= juego.getIdJuego()%>&url=ok">Delete</a></li><br>
                <div class="lineblack" style="width: 98%;"></div>
                <%    
                    }

                    if (juegos.isEmpty() & message == null) {%>
                <p style="padding-top: 40px; font-size: 20px; color: #ffcc00">No matches found.</p>  
                    <%}%>
                </ul>
            <%
                // Muestra el mensaje (si lo hay)
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