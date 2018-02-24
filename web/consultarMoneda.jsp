<%-- 
    Document   : conversor
    Created on : 15-feb-2018, 20:45:24
    Author     : MANUEL MORENO DELGADO 2ºDAM
--%>

<%@page import="jBean.baseMetodos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONSULTAR FLUCTUACIONES</title>
        <link href="estilo.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <h1>CONSULTAR FLUCTUACIONES RESPECTO AL EURO</h1>
        <a href="opcionesDivisas.jsp">Divisas</a>
        
        <form action="consultarProceso.jsp" method="post">
            Elegir divisa <select type="text" name="divisa">
                <%  
                    baseMetodos.getDivisas();
                    
                    for (int i = 1; i < baseMetodos.divisas.size(); i++) {
                        out.print("<option value='"+baseMetodos.divisas.get(i).get(0)+"'>" +baseMetodos.divisas.get(i).get(1)+ "</option>");
                    }
                %>
            </select><br/><br/>
            Fecha de consulta<input type="date" name="fecha"/><br/><br/>  
            <input type="submit" value="CONSULTAR"/>
        </form>
    </body>
</html>
