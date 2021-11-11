<%-- 
    Document   : propertiesExampleJsp
    Created on : 27 Oct 2021, 01:41:23
    Author     : cgallen
--%>

<%@page import="org.bank.model.dto.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String reply = "Null";
    

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Properties Example Jsp</title>
    </head>
    <body>
        <h1>Properties Example Jsp</h1>
        <p><%=reply %></p>
        <form action="./propertiesExample.jsp" method="POST">
            <p>URL Property <input type="text" name="url" value="<%=reply%>"></p>
            <p>Username Property <input type="text" name="username" value="<%=reply%>"></p>
            <p>Password Property <input type="text" name="password" value="<%=reply%>"></p>
            <input type="hidden" name="action" value="updateProperties">

            <button class="btn" type="submit" >Update Properties</button>
        </form> 
    </body>
</html>
