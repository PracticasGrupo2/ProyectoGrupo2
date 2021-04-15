<%@page import="com.sanvalero.easteregg.domain.Juego"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar juegos</title>         
        <link rel="stylesheet" href="css/style.css" type="text/css"><!--<!-- hoja de estilo -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="icon" type="image/png" href="images/moneda.gif" /><!--enlace para icono de la pestaña-->
        <link href="https://fonts.googleapis.com/css2?family=Bangers&family=Chakra+Petch:wght@300&family=Permanent+Marker&family=Press+Start+2P&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"><!--enlace para iconos-->
        
    </head>
    <body>
        <div class="navIzq">
          <a id="esp" href="">OPCIONES</a>
          <br>
          <a href="buscarJuego.jsp">Buscar</a> 
          <a href="juegos.jsp">Ver Juegos</a>
          <a href="desarrolladores.jsp">Ver Desarrolladores</a>
          <a href="registrarJuego.jsp">Registrar Juegos</a>
          <a href="registrarDesarrollador.jsp">Registrar Desarrolladores</a>  
          <a href="novedades.html">Novedades</a>
        </div>
        
        <div class="bodyM">
            <div class="d1">
                <form method="post" action="busqueda.jsp" class="container">
                    <h1>Buscar juego</h1>
                    <br><br>
                    Buscar juego por nombre:
                    <input type="text" name="nombre" value="Escribe aquí el nombre del juego" id="black"/><br/>

                    <input type="submit" value="Buscar" class="btn"/>
                </form>
            </div>   
        
        <%
            String status = request.getParameter("status");
            if (status == null)
                status = "";
                
            if (status.equals("ok")) {
                out.println("<p style='color:green'>La desarrolladora se ha modificado con éxito</p>");
            } else if (status.equals("error")) {
                out.println("<p style='color:red'>No se ha podido modificar la desarrolladora</p>");
            }
        %>
        </div>
        
    </body>
</html>