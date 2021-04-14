<%@page import="com.sanvalero.easteregg.domain.Desarrollador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar desarrollador</title>
    </head>
    <body>
        <h1>Registrar un desarrrollador</h1>
        <form method="post" action="registrar-desarrollador">
            Nombre:
            <input type="text" name="nombre"/><br/>
            Email:
            <input type="text" name="email"/><br/>
            País:
            <input type="text" name="pais"/><br/>

            <input type="submit" value="Registrar"/>
        </form>
        
        <%
            String status = request.getParameter("status");
            if (status == null)
                status = "";
                
            if (status.equals("ok")) {
                out.println("<p style='color:green'>El juego se ha registrado con éxito</p>");
            } else if (status.equals("error")) {
                out.println("<p style='color:red'>No se ha podido registrar el juego</p>");
            }
        %>
    </body>
</html>
