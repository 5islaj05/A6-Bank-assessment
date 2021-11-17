<%-- 
    Document   : admin
    Created on : 17 Nov 2021, 11:54:24
    Author     : hakeem
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="org.solent.ood.creditcardchecker.dao.PropertiesDao" %>
<%@page import="org.solent.ood.creditcardchecker.dao.WebObjectFactory" %>

<%

    PropertiesDao propertiesDao = WebObjectFactory.getPropertiesDao();
    String url = propertiesDao.getProperty("org.solent.ood.creditcardchecker.dao.url");
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
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
            <p><%=message %></p>
        </div>
                
    </body>
</html>
