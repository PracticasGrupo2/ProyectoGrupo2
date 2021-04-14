<%@page import="com.sanvalero.easteregg.domain.Desarrollador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar desarrollador</title>
    </head>
    <body>
       
        <%String id = request.getParameter("id");
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String ubicacion = request.getParameter("ubicacion");
        %>
        
        <h1>Modificar desarrollador</h1>
        <form method="post" action="modificar-desarrollador">
            Nueva desarrolladora:
            <input type="text" name="nombre" value="<%=nombre%>"/><br/>
            Nuevo e-mail:
            <input type="text" name="email" size = "50" value="<%=email%>"/><br/>
            Nuevo pais:
            <input type="text" name="ubicacion" size = "30" value="<%=ubicacion%>"/><br/>
            <input type="hidden" name="id" value="<%=id%>"/><br/>
               
            
            
            <input type="submit" value="Modificar"/>
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