<%@page import="com.sanvalero.easteregg.domain.Juego"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar juego</title>
    </head>
    <body>
       
        <%String id = request.getParameter("id");
        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");
        %>
        
        <h1>Modificar juego</h1>
        <form method="post" action="modificar-juego">
            Nuevo Título:
            <input type="text" name="titulo" value="<%=titulo%>"/><br/>
            Descripción:
            <input type="text" name="descripcion" size = "200" value="<%=descripcion%>"/><br/>
            <input type="hidden" name="id" value="<%=id%>"/><br/>
               
            
            
            <input type="submit" value="Modificar"/>
        </form>
        
        <%
            String status = request.getParameter("status");
            if (status == null)
                status = "";
                
            if (status.equals("ok")) {
                out.println("<p style='color:green'>El juego se ha modificado con éxito</p>");
            } else if (status.equals("error")) {
                out.println("<p style='color:red'>No se ha podido modificar el juego</p>");
            }
        %>
    </body>
</html>

