<%@page import="com.sanvalero.easteregg.domain.Desarrollador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css2?family=Bangers&family=Chakra+Petch:wght@300&family=Permanent+Marker&family=Press+Start+2P&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">      
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link rel="icon" type="image/png" href="images/moneda.gif" /><!--enlace para icono de la pestaña-->
        <title>Modify a developer</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            $(document).ready(function() {
                $("form").on("submit", function(event) {
                    event.preventDefault();
                    
                    var formValues= $(this).serialize();
                    
                    $.post("modificar-desarrollador", formValues, function(data){
                        $("#solu").html(data);
                    });
                });
            });
        </script>
    </head>
    <body>       
        <%String id = request.getParameter("id");
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String ubicacion = request.getParameter("ubicacion");
        %>
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
            <div class="d1">               
                <form class="container">
                    <h1>Modify a developer</h1>
                    New name:
                    <input type="text" name="nombre" value="<%=nombre%>" id="black"/><br/>
                    New email:
                    <input type="text" name="email" size = "50" value="<%=email%>" id="black"/><br/>
                    New country:
                    <input type="text" name="ubicacion" size = "30" value="<%=ubicacion%>" id="black"/><br/>
                    New logo:
                    <input type="file" name="file" accept="image/png, .jpeg, .jpg, image/gif"
                           style="color: transparent; background: transparent"/><br/>
                    <input type="hidden" name="id" value="<%=id%>" id="black"/><br/>
                    <input type="submit" value="Modify" class="btn"/>
                    <div id="solu"></div> 
                </form>
            </div>
        </div><!-- fin class="bodyM" -->    
    </body>
</html>