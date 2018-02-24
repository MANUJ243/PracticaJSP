<%-- 
    Document   : convertirProceso
    Created on : 17-feb-2018, 18:28:01
    Author     : MANUEL MORENO DELGADO 2ºDAM
--%>

<%@page import="jBean.baseMetodos"%>

<%@ include file="conversorMoneda.jsp" %>
<jsp:useBean id="convert" class="jBean.convertirBean"/>
<jsp:setProperty property="*" name="convert"/>

<%
    out.print("El valor es " + baseMetodos.getConversion(convert.formatearValor(),
            convert.getDivisaOrigen(), convert.getDivisaDestino(), convert.getFecha()));
%>
