<%@page import="com.sanvalero.easteregg.domain.Juego"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <h1>Registrar un juego</h1>
        <form>
            Título:
            <input type="text" name="titulo"/><br/>
            Descripción:
            <input type="text" name="descripcion"/><br/>
            Desarrollador:
            <input type="text" name="desarrollador"/><br/>
            Género:
            <input type="text" name="genero"/><br/>
            <input type="submit" value="Registrar"/>
        </form>
        <div id="result"></div> 
    </body>
</html>


