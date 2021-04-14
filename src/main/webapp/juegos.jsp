<%@page import="com.sanvalero.easteregg.dao.GeneroDAO"%>
<%@page import="com.sanvalero.easteregg.domain.Desarrollador"%>
<%@page import="com.sanvalero.easteregg.dao.DesarrolladorDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sanvalero.easteregg.domain.Juego"%>
<%@page import="com.sanvalero.easteregg.dao.JuegoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css2?family=Bangers&family=Chakra+Petch:wght@300&family=Permanent+Marker&family=Press+Start+2P&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">      
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>Listado de juegos</title>         
    </head>
    <body>               
        
             <!-- Side navigation -->
        <div class="navIzq">
          <a href="">OPCIONES</a>
          <br>

          <a href="buscarJuego.jsp">Buscar</a> 
          <a href="juegos.jsp">Ver Juegos</a>
          <a href="desarrolladores.jsp">Ver Desarrolladores</a>
          <a href="registrarJuego.jsp">Registrar Juegos</a>
          <a href="registrarDesarrollador.jsp">Registrar Desarrolladores</a> 
          <a href="novedades.html">Novedades</a>
        </div>
        <section>
            <div class="listaJ" id="lj">
                <div class="lineblack"></div>
                <h1 id="h1L">Lista de juegos (con JSP)</h1>
                <div class="lineblack"></div>
                <%
                    JuegoDAO juegoDAO = new JuegoDAO();
                    ArrayList<Juego> juegos = juegoDAO.getJuegos();
                    
                    DesarrolladorDAO desarrolladorDAO = new DesarrolladorDAO();
                    GeneroDAO generoDAO = new GeneroDAO();
                %>
                <ul>
                <%
                    for (Juego juego : juegos) {
                        String desarrollador = desarrolladorDAO.getNombreDesarrollador(juego.getIdJuego());
                        String genero = generoDAO.getNombreGenero(juego.getIdJuego());
                %>
                <li><div id="tG" ><a href="detalles-juego.jsp?titulo=<%= juego.getTituloJuego()%>&desarrollador=<%=desarrollador%>&genero=<%=genero%>&descripcion=<%=juego.getDescripcionJuego()%>"> <%= juego.getTituloJuego()%></a></div><br>
                <a href="modificarJuego.jsp?id=<%= juego.getIdJuego()%>&titulo=<%=juego.getTituloJuego()%>&descripcion=<%=juego.getDescripcionJuego()%>">Modificar</a><br>
                <a href="eliminar-juegos?id=<%= juego.getIdJuego()%>">Eliminar</a></li>
                
                <%    
                    }
                %>                  
                </ul>
                
                <%
                    // Muestra el mensaje (si lo hay)
                    String message = request.getParameter("message");
                    if (message != null) {
                %>
                    <p style='color:green'><%= message %></p>
                <%        
                    }
                %>               
            </div>
        </section>
    </body>
</html>
