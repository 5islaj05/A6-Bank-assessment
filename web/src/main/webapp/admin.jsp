<%-- 
    Document   : admin
    Created on : 17 Nov 2021, 11:54:24
    Author     : hakeem
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="org.solent.ood.creditcardchecker.dao.PropertiesDao" %>
<%@page import="org.solent.ood.creditcardchecker.dao.WebObjectFactory" %>

<%
//    Verification to make sure you are logged in
//    Checks if the user has already logged in
    boolean loggedin = (boolean) session.getAttribute("isUserLoggedIn");
    
//    If the session object loggedin is not true then this code will run
    if (loggedin != true){
//    Sends you back to index
        String redirectURL = "index.jsp";
        response.sendRedirect(redirectURL);
    }
    
//    Setups the properties
    PropertiesDao propertiesDao = WebObjectFactory.getPropertiesDao();
    String url = propertiesDao.getProperty("org.solent.ood.creditcardchecker.dao.url");
    
//    User Details
    String username = propertiesDao.getProperty("org.solent.ood.creditcardchecker.dao.username");
    String password = propertiesDao.getProperty("org.solent.ood.creditcardchecker.dao.password");
    
//    Card Details
    String cardNum = propertiesDao.getProperty("org.solent.ood.creditcardchecker.dao.cardNum");
    String endDate = propertiesDao.getProperty("org.solent.ood.creditcardchecker.dao.endDate");
    String cvv = propertiesDao.getProperty("org.solent.ood.creditcardchecker.dao.cvv");
    String issueNum = propertiesDao.getProperty("org.solent.ood.creditcardchecker.dao.issueNum");
    
    
//    Message
    String message = "";
    
    String action = (String) request.getParameter("action");
    
    if ("changeCardDetails".equals(action)) {
        message = "Changing Card Details";
        
        cardNum = request.getParameter("cardnumber");
        endDate = request.getParameter("endDate");
        cvv = request.getParameter("cvv");
        issueNum = request.getParameter("issueNumber");
        
        propertiesDao.setProperty("org.solent.ood.creditcardchecker.dao.cardNum", cardNum);
        propertiesDao.setProperty("org.solent.ood.creditcardchecker.dao.endDate", endDate);
        propertiesDao.setProperty("org.solent.ood.creditcardchecker.dao.cvv", cvv);
        propertiesDao.setProperty("org.solent.ood.creditcardchecker.dao.issueNum", issueNum);

    } else if ("changeUserDetails".equals(action)) {
        message = "Changing User Details Details";
        
        username = (String) request.getParameter("username");
        password = (String) request.getParameter("password");
        
        propertiesDao.setProperty("org.solent.ood.creditcardchecker.dao.username", username);
        propertiesDao.setProperty("org.solent.ood.creditcardchecker.dao.password", password);
    } else if ("logout".equals(action)){
        session.setAttribute("isUserLoggedIn",false);
        String redirectURL = "index.jsp";
        response.sendRedirect(redirectURL);
    } else if ("toTransaction".equals(action)){
        String redirectURL = "keypad.jsp";
        response.sendRedirect(redirectURL);
    } else if ("default".equals(action)){
        
        propertiesDao.setProperty("org.solent.ood.creditcardchecker.dao.cardNum", "4285860000000021");
        propertiesDao.setProperty("org.solent.ood.creditcardchecker.dao.endDate", "11/21");
        propertiesDao.setProperty("org.solent.ood.creditcardchecker.dao.cvv", "123");
        propertiesDao.setProperty("org.solent.ood.creditcardchecker.dao.issueNum", "01");
        
        propertiesDao.setProperty("org.solent.ood.creditcardchecker.dao.username", "admin");
        propertiesDao.setProperty("org.solent.ood.creditcardchecker.dao.password", "admin");
    }
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/Footer-Basic.css">
        <link rel="stylesheet" href="assets/css/styles.css">
        <title>Admin Login</title>
    </head>
    <body>
        
        <div class="row card-body align-items-center justify-content-center ">
            <div class="col-sm-10">
                <div class="card shadow-lg">
                    <div class="card-body">
                        <form method="post">
                            <div class="col">
                                <h3>Input your card details</h3>
                                
                                <div class="mb-2">
                                    <label for="cardnumber">Card Number</label>
                                    <input id="cardnumber" type="text" class="form-control" name="cardnumber" value=<%= cardNum %>>
                                </div>
                                <div class="mb-2">
                                    <label for="date">End Date</label>
                                    <input id="date" type="text" class="form-control" name="endDate" value=<%= endDate %>>
                                </div>
                                <div class="mb-2">
                                    <label for="cvv">CVV</label>
                                    <input id="cvv" type="text" class="form-control" name="cvv" value=<%= cvv %>>
                                </div>
                                <div class="mb-2">
                                    <label for="issuenumber">Issuer Number</label>
                                    <input id="issuenumber" type="text" class="form-control" name="issueNumber" value=<%= issueNum %>>
                                </div>
                            </div>
                            <input type="hidden" name="action" value="changeCardDetails">
                            <button type="submit" class="btn btn-primary">Change Card Details</button>
                        </form>
                                
                        <form method="post">
                            <div class="col">
                                <h3>Input your new User Details</h3>
                                
                                <div class="mb-2">
                                    <label for="username">Username:</label>
                                    <input id="username" type="text" class="form-control" name="username" value=<%= username %>>
                                </div>
                                <div class="mb-2">
                                    <label for="password">Password:</label>
                                    <input id="password" type="text" class="form-control" name="password" value=<%= password %>>
                                </div>
                                
                                <input type="hidden" name="action" value="changeUserDetails">
                                <button type="submit" class="btn btn-primary">Change User Details</button>
                            </div>
                        </form>
                        
                        <p class="msg"><%=message %></p>
                        <div class="navbuttons"> 
                            
                            <form>
                                <input type="hidden" name="action" value="logout">
                                <button type="submit" class="btn btn-danger">Logout</button>
                            </form>

                            <form>
                                <input type="hidden" name="action" value="toTransaction">
                                <button type="submit" class="btn btn-warning">Go to Transaction Page</button>
                            </form>
                            
                            <form>
                                <input type="hidden" name="action" value="defaults">
                                <button type="submit" class="btn btn-success">Set to default values</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
