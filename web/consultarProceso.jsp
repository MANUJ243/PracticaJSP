<%-- 
    Document   : insertarProceso
    Created on : 15-feb-2018, 23:43:17
    Author     : MANUEL MORENO DELGADO 2ºDAM
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="jBean.baseMetodos"%>

<%@ include file="consultarMoneda.jsp" %>
<jsp:useBean id="consult" class="jBean.consultarBean"/>
<jsp:setProperty property="*" name="consult"/>

<%    
    if (consult.getFecha() != null) {
        ResultSet rs = baseMetodos.getCambios(consult.getDivisa(), consult.formatearFecha());
        
        while (rs.next()) {
            out.print("En " + rs.getString(3) + " un EURO eran " + rs.getDouble(4) + " " + rs.getString(2));
            out.print("<br>");
        }
    } else {
        out.print("No has seleccionado una fecha.");
    }
%>
