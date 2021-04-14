<%@page import="com.sanvalero.easteregg.domain.Juego"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar juegos</title>
    </head>
    <body>

        
        <h1>Buscar juego</h1>
        <form method="post" action="busqueda.jsp">
            Buscar juego por nombre:
            <input type="text" name="nombre" value="Escribe aquí el nombre del juego"/><br/>
 
            <input type="submit" value="Buscar"/>
        </form>
        
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
    </body>
</html>