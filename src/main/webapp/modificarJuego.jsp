<%@page import="com.sanvalero.easteregg.domain.Juego"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar juego</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            $(document).ready(function() {
                $("form").on("submit", function(event) {
                    event.preventDefault();
                    
                    var formValues= $(this).serialize();
                    
                    $.post("modificar-juego", formValues, function(data){
                        $("#result").html(data);
                    });
                });
            });
        </script>
    </head>
    <body>
       
        <%String id = request.getParameter("id");
        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");
        %>
        
        <h1>Modificar juego</h1>
        <form>
            Nuevo Título:
            <input type="text" name="titulo" value="<%=titulo%>"/><br/>
            Descripción:
            <input type="text" name="descripcion" size = "200" value="<%=descripcion%>"/><br/>
            <input type="hidden" name="id" value="<%=id%>"/><br/>
               
            
            
            <input type="submit" value="Modificar"/>
        </form>
        <div id="result"></div>
    </body>
</html>

