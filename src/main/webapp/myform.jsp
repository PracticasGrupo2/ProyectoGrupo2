<%@page import="com.sanvalero.easteregg.domain.Juego"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My form</title>
    </head>
    <body>
        <h1>Ejemplo de formulario web</h1>
        <form method="post" action="registrar-juego">
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
