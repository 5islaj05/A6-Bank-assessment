<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<%-- 
    Document   : index
    Created on : 13 nov. 2021, 8:40:28
    Author     : guill
--%>

<%@page import="org.solent.ood.creditcardchecker.dao.PropertiesDao" %>
<%@page import="org.solent.ood.creditcardchecker.dao.WebObjectFactory" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
//    Sets User session to not logged in
    session.setAttribute("isUserLoggedIn",false);
    
    // IN CASE THE USER LOGGED IN
    PropertiesDao propertiesDao = WebObjectFactory.getPropertiesDao();

    //Takes user and pass from index form
    String username = propertiesDao.getProperty("org.solent.ood.creditcardchecker.dao.username");
    String password = propertiesDao.getProperty("org.solent.ood.creditcardchecker.dao.password");
    
    
//    Checks if the properties file has a username or password already
//    If not it will set it to the defaults of admin admin
    if (username == null && password == null){
        propertiesDao.setProperty("org.solent.ood.creditcardchecker.dao.username", "admin");
        propertiesDao.setProperty("org.solent.ood.creditcardchecker.dao.password", "admin");
    }
    
    String message = "";
    String action = (String) request.getParameter("action");
//    Listens for the form submit with action "login"
    if ("login".equals(action)) {
//    Checks if the username and password are equal to whats inside the properties file
        if(request.getParameter("username").equals(username) && request.getParameter("password").equals(password)){
//        If successful it will redirect the page to the admin login page and sets the session to logged in
            session.setAttribute("isUserLoggedIn",true);
            session.setAttribute("sessionUser", username);
            String redirectURL = "admin.jsp";
            response.sendRedirect(redirectURL);
        }else{
//        otherwise give us an error msg
            message = "Error Logging in Double check Username/Password....Default == user: admin, password: admin";
        }
    }
%>    

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>bank</title>
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/Footer-Basic.css">
        <link rel="stylesheet" href="assets/css/styles.css">
    </head>
    <body style="opacity: 1;font-size: 16px;">
        <div class="container mt-2">
            <div class="row justify-content-center align-items-center p-2">
                <div class="m-1 col-sm-8 col-md-6 col-lg-4 shadow-sm pt-5 pb-5 mb-5 bg-white border rounded">
                    <p class="text-center text-uppercase mt-3">Login to change Admin Details or Continue for transactions</p>
                    <form class="form"  method="POST">
                        <div class="form-group input-group-md">
                            <label for="username">Username</label>
                            <input id="username" type="text" class="form-control" name="username" value=<%= username %>>
                        </div>
                        <div class="form-group input-group-md">
                            <label for="password">Password</label>
                            <input id="password" type="password" class="form-control" name="password" value=<%= password %>>
                        </div>
                        <input type="hidden" name="action" value="login">
                        <button class="btn btn-lg btn-block btn-primary mt-4" type="submit">Login</button>
                        
                        <a href="./first.jsp" class="btn btn-lg btn-block btn-success mt-4" role="button">Continue</a>
                    </form>
                    
                    <p><%= message %></p>
                </div>
            </div>
        </div>
    </body>

</html>