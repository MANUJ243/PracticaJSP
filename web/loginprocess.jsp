<%-- 
    Document   : loginprocess
    Created on : 14-feb-2018, 10:20:25
    Author     : MANUEL MORENO DELGADO 2ºDAM
--%>

<%@page import="jBean.baseMetodos"%>
<%@page import="jBean.LoginDao"%>  
<jsp:useBean id="obj" class="jBean.LoginBean" scope="session"/>

<jsp:setProperty property="*" name="obj"/>  

<%
    boolean status = LoginDao.validate(obj);
    if (status && obj.getCont() < 4) {
        out.println("LOGIN CON EXITO");
        session.setAttribute("session", "TRUE");
        baseMetodos.getDivisas();
%>
    <a href="adivinar_numero.jsp">Adivinar numero</a>
    <a href="opcionesDivisas.jsp">Divisas</a>
<%
} else if(obj.getCont() < 4){
    out.print("USUARIO O CONTRASENA INCORRECTA");
    obj.sumCont();
%>  
<jsp:include page="index.jsp"></jsp:include>  
<%
    }else{
        out.print("Has superado el numero de intentos");
    }
%>  
