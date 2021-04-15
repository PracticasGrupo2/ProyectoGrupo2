<%@page import="com.sanvalero.easteregg.domain.Desarrollador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar desarrollador</title>
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
        
        <h1>Modificar desarrollador</h1>
        <form>
            Nueva desarrolladora:
            <input type="text" name="nombre" value="<%=nombre%>"/><br/>
            Nuevo e-mail:
            <input type="text" name="email" size = "50" value="<%=email%>"/><br/>
            Nuevo pais:
            <input type="text" name="ubicacion" size = "30" value="<%=ubicacion%>"/><br/>
            <input type="hidden" name="id" value="<%=id%>"/><br/>
            
            <input type="submit" value="Modificar"/>
        </form>
        <div id="solu"></div> 
    </body>
</html>