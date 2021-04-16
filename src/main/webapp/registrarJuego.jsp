<%@page import="com.sanvalero.easteregg.domain.Juego"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css2?family=Bangers&family=Chakra+Petch:wght@300&family=Permanent+Marker&family=Press+Start+2P&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">      
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link rel="icon" type="image/png" href="images/moneda.gif" /><!--enlace para icono de la pestaña-->
        <title>Registrar juego</title> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            $(document).ready(function() {
                $("form").on("submit", function(event) {
                    event.preventDefault();
                    
                    var formValues= $(this).serialize();
                    
                    $.post("registrar-juego", formValues, function(data){
                        $("#result").html(data);
                    });
                });
            });
        </script>
    </head>
    <body>       
        <!-- menu -->
        <div class="navIzq">           
          <a id="esp" href="#">OPCIONES</a>
          <br>
          <a href="buscarJuego.jsp">Buscar</a> 
          <a href="juegos.jsp?page=0">Ver Juegos</a>
          <a href="desarrolladores.jsp?page=0">Ver Desarrolladores</a>
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
            <div class="d1"> 
                <form class="container">
                    <h1>Registrar un juego</h1>
                    <br><br>
                    Título:
                    <input type="text" name="titulo" id="black"/><br/>
                    Descripción:
                    <input type="text" name="descripcion" id="black"/><br/>
                    Desarrollador:
                    <input type="text" name="desarrollador" id="black"/><br/>
                    Género:

                    <input type="text" name="genero" id="black"/><br/>
                    Subir imagen:
                    <input type="file" name="file" accept="image/png, .jpeg, .jpg, image/gif"
                           style="color: transparent; background: transparent; padding-bottom: 20px"/><br/>

                    <input type="submit" value="Registrar" class="btn"/>
                    <br>
                    <div id="result"></div> 
                </form>
            </div>                
        </div>
    </body>
</html>


