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




<%
    String bankUrl = "http://localhost:8080/bank/rest";
    BankRestClient client = new BankRestClientImpl(bankUrl);

    TransactionReplyMessage reply = null;

    String action = null;
    action = request.getParameter("action");

    CreditCard cardFrom = null;
    CreditCard cardTo = null;

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

        cardFrom = new CreditCard();
        cardTo = new CreditCard();

    }


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lest send a request!</h1>

        <form action="./first.jsp" method="post">
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

        <h1><%= reply.getAmount() %> POUNDS WERE SUCCESFULLY TRANFERED FROM <%= reply.getFromCardNo() %> TO <%= reply.getToCardNo() %></h1>
        
        <form action="./first.jsp" method="post">
            <input type="hidden" name="name" value=<%=cardTo%>>
            <input type="hidden" name="endDate" value=<%=cardFrom%>>
            <input type="hidden" name="action" value="refund">
            <input type="hidden" name="newCardFrom" value=<%=cardTo%>>
            <input type="hidden" name="newCardTo" value=<%=cardFrom%>>
            <input type="hidden" name="action" value="refund">
            <input type="hidden" name="newCardFrom" value=<%=cardTo%>>
            <input type="hidden" name="newCardTo" value=<%=cardFrom%>>
            <input type="hidden" name="action" value="refund">
            <input type="hidden" name="action" value="refund"> 
            <button type="submit" >Refund Transaction!</button>
        </form>

        <%} else if (reply.getStatus().equals(BankTransactionStatus.FAIL)) {%>
        <h1>No transaction was made</h1>

        <% }%>
        <% }%>

    </body>
</html>

