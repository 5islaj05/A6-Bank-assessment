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
        String amountString = request.getParameter("amount");
        double amount = Double.parseDouble(amountString);
        
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
        
//        Amount
        String amountString = request.getParameter("amount");
        double amount = Double.parseDouble(amountString);
        
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
            <jsp:include page="navbar.jsp" />



            <jsp:include page="mainForm.jsp" />


            <% if (("transaction".equals(action))) {%>

            <%=cardFrom%> <br>

            <%=cardTo%> <br>

            <h6><%= reply.toString()%> <br></h6>

                <% if (reply.getStatus().equals(BankTransactionStatus.SUCCESS)) {%>

                <h1><%= reply.getAmount()%> POUNDS WERE SUCCESSFULLY TRANSFERRED FROM <%= reply.getFromCardNo()%> TO <%= reply.getToCardNo()%></h1>

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
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>