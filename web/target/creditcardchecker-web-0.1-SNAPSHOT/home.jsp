<%@page import="java.nio.file.StandardOpenOption"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.util.function.Function"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!------ Include the above in your HEAD tag ---------->

<%-- 
    Document   : first
    Created on : 3 nov. 2021, 12:49:25
    Author     : guill
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="org.solent.com504.oodd.bank.model.dto.CreditCard" %>
<%@ page import="org.solent.com504.oodd.bank.client.impl.BankRestClientImpl" %>
<%@ page import="org.solent.com504.oodd.bank.model.client.BankRestClient" %>

<%@ page import="org.solent.com504.oodd.bank.model.dto.BankTransactionStatus" %>
<%@ page import="org.solent.com504.oodd.bank.model.dto.TransactionReplyMessage" %>


<%@ page import="org.apache.logging.log4j.LogManager" %>
<%@ page import="org.apache.logging.log4j.Logger" %>


<%
    //String bankUrl = "http://localhost:8080/bank/rest";
    String bankUrl = "http://com528bank.ukwest.cloudapp.azure.com:8080/rest/";
    BankRestClient client = new BankRestClientImpl(bankUrl);

    TransactionReplyMessage reply = null;

    String action = null;
    action = request.getParameter("action");

    CreditCard cardFrom = null;
    CreditCard cardTo = null;
    
  //  final Logger LOG = LogManager.getLogger(BankClientTest.class);

    if ("transaction".equals(action)) {

        //Card From
        String name1 = request.getParameter("name1");
        String endDate1 = request.getParameter("endDate1");
        String cardnumber1 = request.getParameter("cardnumber1");
        String cvv1 = request.getParameter("cvv1");
        String issueNumber1 = request.getParameter("issueNumber1");

        cardFrom = new CreditCard();

        cardFrom.setName(name1);
        cardFrom.setEndDate(endDate1);
        cardFrom.setCardnumber(cardnumber1);
        cardFrom.setCvv(cvv1);
        cardFrom.setIssueNumber(issueNumber1);

        //Card To
        String name2 = request.getParameter("name2");
        String endDate2 = request.getParameter("endDate2");
        String cardnumber2 = request.getParameter("cardnumber2");
        String cvv2 = request.getParameter("cvv2");
        String issueNumber2 = request.getParameter("issueNumber2");

        cardTo = new CreditCard();

        cardTo.setName(name2);
        cardTo.setEndDate(endDate2);
        cardTo.setCardnumber(cardnumber2);
        cardTo.setCvv(cvv2);
        cardTo.setIssueNumber(issueNumber2);

        //Amount
        Double amount = 50.0;

        reply = client.transferMoney(cardFrom, cardTo, amount);
        // client.transferMoney(cardFrom, cardTo, amount);
    } else if ("refund".equals(action)) {

        String name3 = request.getParameter("name3");
        String endDate3 = request.getParameter("endDate3");
        String cardnumber3 = request.getParameter("cardnumber3");
        String cvv3 = request.getParameter("cvv3");
        String issueNumber3 = request.getParameter("issueNumber3");

        cardFrom = new CreditCard();

        cardFrom.setName(name3);
        cardFrom.setEndDate(endDate3);
        cardFrom.setCardnumber(cardnumber3);
        cardFrom.setCvv(cvv3);
        cardFrom.setIssueNumber(issueNumber3);

        //Card To
        String name4 = request.getParameter("name4");
        String endDate4 = request.getParameter("endDate4");
        String cardnumber4 = request.getParameter("cardnumber4");
        String cvv4 = request.getParameter("cvv4");
        String issueNumber4 = request.getParameter("issueNumber4");

        cardTo = new CreditCard();

        cardTo.setName(name4);
        cardTo.setEndDate(endDate4);
        cardTo.setCardnumber(cardnumber4);
        cardTo.setCvv(cvv4);
        cardTo.setIssueNumber(issueNumber4);

        Double amount = 50.0;

        reply = client.transferMoney(cardFrom, cardTo, amount);

    }


%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>bank</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/Footer-Basic.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
    <div id="homeBackground">
        <nav class="navbar navbar-light navbar-expand-md" style="background: #1e2167;color: rgb(255,255,255);">
            <div class="container-fluid"><a class="navbar-brand" href="index.html" style="color: rgba(255,255,255,0.9);">Bank Application</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navcol-1">
                    <ul class="navbar-nav" style="color: rgb(255,255,255);">
                        <li class="nav-item"><a class="nav-link" href="#" style="color: rgb(255,255,255);">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#" style="color: rgb(255,255,255);">Bank accounts</a></li>
                        <li class="nav-item"><a class="nav-link" href="#" style="color: rgb(255,255,255);">Transactions</a></li>
                        <li class="nav-item"><a class="nav-link" href="#" style="color: rgb(255,255,255);">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="#" style="color: rgb(255,255,255);">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <div>
            <h1>Enter payer's details</h1>

        <form action="./home.jsp" method="post">
            <div class="container">
                <div class="row">
                    <div class="col-sm-5>

                         <h3>From Card</h3>
                         <label for="fname">Name:</label><br>
                        <input type="text" name="name1" value="test user1"><br>
                        <label for="lname">End date:</label><br>
                        <input type="text" name="endDate1" value="11/21"><br>
                        <label for="lname">Card Number:</label><br>
                        <input type="text" name="cardnumber1" value="5133880000000012"><br>
                        <label for="fname">CVV:</label><br>
                        <input type="text" name="cvv1" value="123"><br>
                        <label for="lname">Issuer Name:</label><br>
                        <input type="text" name="issueNumber1" value="01"><br>
                    </div>
                    <h1>Enter payee's details</h1>
                    <div class="col-sm-5>
                         <h3>To Card</h3>
                         <label for="fname">Name:</label><br>
                        <input type="text" name="name2" value="test user2"><br>
                        <label for="lname">End date:</label><br>
                        <input type="text" name="endDate2" value="11/21"><br>
                        <label for="lname">Card Number:</label><br>
                        <input type="text" name="cardnumber2" value="4285860000000021"><br>
                        <label for="fname">CVV:</label><br>
                        <input type="text" name="cvv2" value="123"><br>
                        <label for="lname">Issuer Name:</label><br>
                        <input type="text" name="issueNumber2" value="01"><br>
                    </div>
                </div>
            </div>
            <h3>Amount:</h3>
            <input type="number" name="amount" value=50><br><br>
            <input type="hidden" name="action" value="transaction">
            <input type="submit" value="Submit">
        </form> 




        <% if (("transaction".equals(action))) {%>

        <%=cardFrom%> <br>

        <%=cardTo%> <br>

        <h6><%= reply.toString()%> <br></h6>

            <% if (reply.getStatus().equals(BankTransactionStatus.SUCCESS)) {%>

            <h1><%= reply.getAmount()%> POUNDS WERE SUCCESFULLY TRANFERED FROM <%= reply.getFromCardNo()%> TO <%= reply.getToCardNo()%></h1>

            <% //    Files.write(Paths.get("web\src\main\resources\transactions-register.txt"), (reply.toString()).getBytes(), StandardOpenOption.APPEND);
%>
            
            <form action="./home.jsp" method="post">
                <input type="hidden" name="name3" value=<%=cardTo.getName()%>>
                <input type="hidden" name="endDate3" value=<%=cardTo.getEndDate()%>>
                <input type="hidden" name="cardnumber3" value=<%=cardTo.getCardnumber()%>>
                <input type="hidden" name="cvv3" value=<%=cardTo.getCvv()%>>
                <input type="hidden" name="issueNumber3" value=<%=cardTo.getIssueNumber()%>>
                <input type="hidden" name="name4" value=<%=cardFrom.getName()%>>
                <input type="hidden" name="endDate4" value=<%=cardFrom.getEndDate()%>>
                <input type="hidden" name="cardnumber4" value=<%=cardFrom.getCardnumber()%>>
                <input type="hidden" name="cvv4" value=<%=cardFrom.getCvv()%>>
                <input type="hidden" name="issueNumber4" value=<%=cardFrom.getIssueNumber()%>>
                <input type="hidden" name="action" value="refund"> 
                <button type="submit" >Refund Transaction!</button>
            </form>

            <%} else if (reply.getStatus().equals(BankTransactionStatus.FAIL)) {%>
            <h1>No transaction was made</h1>

            <% }%>
        <% }if (("refund".equals(action))) {%>
        <h1>Lo hicsite wacho</h1> <br>
         <%=cardFrom%> <br>

        <%=cardTo%> <br>
        <% }%>
        </div>
        
        
        
        <footer class="footer-basic" style="border-color: rgb(255,255,255);padding: 10px 0px;background: rgb(30,33,103);">
            <p class="font-monospace text-center copyright" style="margin: 0px;color: rgb(255,255,255);">Bank Application is using copyrighted content under Fair Use and Fair Dealing doctrines. This website has been created only for educational purposes and it will never be published.</p>
            <p class="copyright" style="margin: 10px;margin-bottom: 0px;color: rgb(255,255,255);">Bank Application&nbsp; 2021</p>
        </footer>
    </div>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>