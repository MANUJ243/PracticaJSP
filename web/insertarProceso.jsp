<%-- 
    Document   : insertarProceso
    Created on : 15-feb-2018, 23:43:17
    Author     : MANUEL MORENO DELGADO 2ºDAM
--%>

<%@page import="jBean.baseMetodos"%>

<%@ include file="insertarDivisa.jsp" %>
<jsp:useBean id="insert" class="jBean.insertarBean"/>
<jsp:setProperty property="*" name="insert"/>

<%    
    if (insert.getFecha() != null) {
        String[] valores = {insert.getDivisa(), insert.formatearFecha(), insert.formatearValor()};

        if (baseMetodos.insertRow(valores)) {
            out.print("Insertado con exito");
        } else {
            out.print("Error en la insercion");
        }
    } else {
        out.print("No has seleccionado una fecha.");
    }
%>
