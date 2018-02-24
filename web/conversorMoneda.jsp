<%-- 
    Document   : conversorMoneda
    Created on : 15-feb-2018, 20:49:29
    Author     : MANUEL MORENO DELGADO 2ºDAM
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="jBean.baseMetodos"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="PaginaError.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONVERSOR</title>
    </head>
    <body>
        <h1>CONVERSOR</h1>
        <a href="opcionesDivisas.jsp">Divisas</a>

        <form action="convertirProceso.jsp" method="post">
            Importe a convertir<input type="text" name="importe"/><br/><br/>
            De la divisa <select type="text" name="divisaOrigen">
                <%  baseMetodos.getDivisas();
                    for (int i = 0; i < baseMetodos.divisas.size(); i++) {
                        out.print("<option value='" + baseMetodos.divisas.get(i).get(0) + "'>" + baseMetodos.divisas.get(i).get(1) + "</option>");
                    }
                %>
            </select>
            A la divisa <select type="text" name="divisaDestino">
                <%  baseMetodos.getDivisas();
                    for (int i = 0; i < baseMetodos.divisas.size(); i++) {
                        out.print("<option value='" + baseMetodos.divisas.get(i).get(0) + "'>" + baseMetodos.divisas.get(i).get(1) + "</option>");
                    }
                %>
            </select><br/><br/>
            Fecha de conversion <select type="text" name="fecha">
                <%  ResultSet rs = baseMetodos.getFechas();
                    while (rs.next()) {
                        out.print("<option>" + rs.getString(1) + "</option>");
                    }
                %>
            </select><br/><br/>
            <input type="submit" value="CONVERTIR"/>
        </form>
    </body>
</html>
