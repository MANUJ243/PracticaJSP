<%-- 
    Document   : insertarDivisa
    Created on : 15-feb-2018, 20:28:17
    Author     : MANUEL MORENO DELGADO 2ºDAM
--%>

<%@page import="jBean.baseMetodos"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="PaginaError.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INSERTAR DIVISA</title>
    </head>
    <body>
        <h1>INSERTAR FLUCTUACION DE DIVISA RESPECTO AL EURO</h1>
        <a href="opcionesDivisas.jsp">Divisas</a>
        
        <form action="insertarProceso.jsp" method="post">
            Valor del cambio <input type="text" name="valor"/><br/><br/>
            Elegir divisa <select type="text" name="divisa">
                <%
                    baseMetodos.getDivisas();
                    
                    for (int i = 0; i < baseMetodos.divisas.size(); i++) {
                        out.print("<option value='"+baseMetodos.divisas.get(i).get(0)+"'>" +baseMetodos.divisas.get(i).get(1)+ "</option>");
                    }
                %>
            </select><br/><br/>
            Fecha del cambio<input type="date" name="fecha"/><br/><br/>  
            <input type="submit" value="INSERTAR FLUCTUACION"/>
        </form>
    </body>
</html>
