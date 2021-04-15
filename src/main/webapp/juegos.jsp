<%@page import="com.sanvalero.easteregg.dao.GeneroDAO"%>
<%@page import="com.sanvalero.easteregg.domain.Desarrollador"%>
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
        <title>Listado de juegos</title>         
    </head>
    <body>               
     <!-- menu -->
        <div class="navIzq">
          <a id="esp" href="#">OPCIONES</a>
          <br>
          <a href="buscarJuego.jsp">Buscar</a> 
          <a href="juegos.jsp">Ver Juegos</a>
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

            <div class="lineblack"></div>
                <h1 id="tit">Lista de juegos (con JSP)</h1>
                <div class="lineblack"></div>
            
            <div class="listaJ" id="lj">
                <ul id="put0">
                    <li id="put1"><img src="images/img6.jpg" alt="alt" /><img src="images/img3.jpg" alt="alt" /></li>
                    <li id="put1"><img src="images/img4.jpg" alt="alt" /><img src="images/img5.jpg" alt="alt" /></li>
                    <li id="put1"><img src="images/img7.jpg" alt="alt" /><img src="images/img8.jpg" alt="alt" /></li>
                    <li id="put1"><img src="images/img9.jpg" alt="alt" /><img src="images/img10.jpg" alt="alt" /></li>
                    <li id="put1"><img src="images/img11.jpg" alt="alt" /><img src="images/img12.jpg" alt="alt" /></li>
                    <li id="put1"><img src="images/img13.jpg" alt="alt" /><img src="images/img14.jpg" alt="alt" /></li>
                </ul>    
                
                <%
                    JuegoDAO juegoDAO = new JuegoDAO();
                    ArrayList<Juego> juegos = juegoDAO.getJuegos();
                    
                    DesarrolladorDAO desarrolladorDAO = new DesarrolladorDAO();
                    GeneroDAO generoDAO = new GeneroDAO();
                %>
                <ul id="put0">                    
                <%
                    for (Juego juego : juegos) {
                        String desarrollador = desarrolladorDAO.getNombreDesarrollador(juego.getIdJuego());
                        String genero = generoDAO.getNombreGenero(juego.getIdJuego());
                %>
                <li id="put1"><div id="tG" ><a href="detalles-juego.jsp?titulo=<%= juego.getTituloJuego()%>&desarrollador=<%=desarrollador%>&genero=<%=genero%>&descripcion=<%=juego.getDescripcionJuego()%>"> <%= juego.getTituloJuego()%></a></div>
                <a href="modificarJuego.jsp?id=<%= juego.getIdJuego()%>&titulo=<%=juego.getTituloJuego()%>&descripcion=<%=juego.getDescripcionJuego()%>">Modificar</a><br>
                <a href="eliminar-juegos?id=<%= juego.getIdJuego()%>&url=b">Eliminar</a></li>
                
                <br>
                <div class="lineblack"></div>
                <br>
                
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
                <ul id="put0">
                    <li id="put1"><img src="images/img6.jpg" alt="alt" /><img src="images/img3.jpg" alt="alt" /></li>
                    <li id="put1"><img src="images/img4.jpg" alt="alt" /><img src="images/img5.jpg" alt="alt" /></li>
                    <li id="put1"><img src="images/img7.jpg" alt="alt" /><img src="images/img8.jpg" alt="alt" /></li>
                    <li id="put1"><img src="images/img9.jpg" alt="alt" /><img src="images/img10.jpg" alt="alt" /></li>
                    <li id="put1"><img src="images/img11.jpg" alt="alt" /><img src="images/img12.jpg" alt="alt" /></li>
                    <li id="put1"><img src="images/img13.jpg" alt="alt" /><img src="images/img14.jpg" alt="alt" /></li>
                </ul> 
            </div>            
        </div>
    </body>
</html>
