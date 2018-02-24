<%-- 
    Document   : login
    Created on : 14-feb-2018, 10:06:43
    Author     : MANUEL MORENO DELGADO 2ºDAM
--%>
<%@ include file="index.jsp" %>
<hr/>  

<h3>Login Form</h3>

<br/>  
<form action="loginprocess.jsp" method="post">  
    Email:<input type="text" name="email"/><br/><br/>  
    Password:<input type="password" name="pass"/><br/><br/>  
    <input type="submit" value="login"/>
</form>  
