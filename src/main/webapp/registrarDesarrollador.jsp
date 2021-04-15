<%@page import="com.sanvalero.easteregg.domain.Desarrollador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar desarrollador</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            $(document).ready(function() {
                $("form").on("submit", function(event) {
                    event.preventDefault();
                    
                    var formValues= $(this).serialize();
                    
                    $.post("registrar-desarrollador", formValues, function(data){
                        $("#solu").html(data);
                    });
                });
            });
        </script>
    </head>
    <body>
        <h1>Registrar un desarrrollador</h1>
        <form>
            Nombre:
            <input type="text" name="nombre"/><br/>
            Email:
            <input type="text" name="email"/><br/>
            País:
            <input type="text" name="pais"/><br/>
            <input type="submit" value="Registrar"/>
        </form>
        <div id="solu"></div>
    </body>
</html>
