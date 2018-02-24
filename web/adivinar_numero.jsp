<%-- 
    Document   : adivinar_numero
    Created on : 14-nov-2012, 17:40:39
    Author     : Antonio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import = "jBean.numeroGenerado" %>
<jsp:useBean id="numguess2" class="jBean.numeroGenerado" scope="session" />
<jsp:setProperty name="numguess2" property="*" />

<html>
    <head><title>Numero para adivinar</title></head>
    <body bgcolor="white">
        <font size=4>
        <% if (numguess2.getSuccess()) {%>
        Enhorabuena, lo has adivinado.
        Y justo despues de <%= numguess2.getNumGuesses()%>
        intentos.<p>
            <% numguess2.reset(); %>
            Adivinado  <a href="adivinar_numero.jsp">¿quieres jugar otra vez ?</a>
            <% } else if (numguess2.getNumGuesses() == 0) { %>
            Bienvenido al juego de adivina un numero.<p>
            Tienes que introducir un numero entre 1 y 100.<p>
        <form method=get>
            ¿Cual es el numero que piensas? <input type=text name=guess>
            <input type=submit value="Submit">
        </form>
        <% } else {%>
        Buen intento, pero no. El nuevo intento debe ser <b><%= numguess2.getHint()%></b>.
        Tu has realizado <%= numguess2.getNumGuesses()%>
        intentos.
        Tienes que introducir un numero entre 1 y 100.<p>
        <form method=get>
            ¿Cual es el numero que piensas? <input type=text name=guess>
            <input type=submit value="Submit">
        </form>
        <% }%>
        </font>
    </body>
</html>
