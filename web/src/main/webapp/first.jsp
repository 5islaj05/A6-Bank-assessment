<%@page import="java.io.IOException"%>
<%@page import="java.nio.file.StandardOpenOption"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.util.function.Function"%>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<%--
    Document   : first
    Created on : 3 nov. 2021, 12:49:25
    Author     : guill
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="org.solent.ood.bank.model.dto.CreditCard" %>
<%@ page import="org.solent.ood.bank.client.impl.BankRestClientImpl" %>
<%@ page import="org.solent.ood.bank.model.client.BankRestClient" %>

<%@ page import="org.solent.ood.bank.model.dto.BankTransactionStatus" %>
<%@ page import="org.solent.ood.bank.model.dto.TransactionReplyMessage" %>

<%@page import="org.solent.ood.creditcardchecker.dao.PropertiesDao" %>
<%@page import="org.solent.ood.creditcardchecker.dao.WebObjectFactory" %>

<%@ page import="org.apache.logging.log4j.LogManager" %>
<%@ page import="org.apache.logging.log4j.Logger" %>

<!--<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css"> -->


<%
    // IN CASE THE USER LOGGED IN

    //Takes user and pass from index form

//    if (request.getParameter("user") == username and request.getParameter("password") == password) {
//        
//        
//    }
//
//    String sessionUser = (String) session.getAttribute("sessionUser");
//
//    if (sessionUser == null) {
//
//        session.setAttribute("sessionUser", user);
//        session.setAttribute("sessionPassword", password);
//        System.out.println("METEMOS USER Y PASS EN SESION");
//        System.out.println((String) session.getAttribute("sessionUser"));
//        System.out.println((String) session.getAttribute("sessionPassword"));
//    }

//    setting up properties
    PropertiesDao propertiesDao = WebObjectFactory.getPropertiesDao();
    
    

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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/Footer-Basic.css">
        <link rel="stylesheet" href="assets/css/styles.css">
        <title>Main Page</title>
    </head>
    <body>

        <div class="row card-body align-items-center justify-content-center ">
            <div class="col-sm-10">
                <div class="card shadow-lg">
                    <div class="card-body">
                        <h1 class="card-title">Lets Transfer some Moneys</h1>
                        <hr>
                        <% boolean loggedin = (boolean) session.getAttribute("isUserLoggedIn"); %>
                        
                        <% if (loggedin == false) { %>
                            Not logged in
                        <% } else {%>

                            <p class="msg">Logged in as <%= session.getAttribute("sessionUser")%></p>
                            <div class="navbuttons">
                                
                                <form action="./first.jsp" method="post">
                                    <input type="hidden" class="form-control" name="action" value="logout">
                                    <button class="btn btn-lg btn-block btn-danger mt-4" type="submit">Logout</button>
                                </form>
                                
                                <form action="./admin.jsp" method="post">
                                    <input type="hidden" class="form-control" name="action" value="modify">
                                    <button class="btn btn-lg btn-block btn-warning mt-4" type="submit">Modify</button>
                                </form>
                            </div>
                        <% }%>

                        <hr>

                        <% if (("transaction".equals(action))) {%>

                        <h6><%= reply.toString()%> <br></h6>

                        <% if (reply.getStatus().equals(BankTransactionStatus.SUCCESS)) {%>

                            <div class="alert alert-info">
                                <a class="close" data-dismiss="alert" href="#">×</a>
                                £<%= reply.getAmount()%> WERE SUCCESSFULLY TRANSFERRED FROM <%= reply.getFromCardNo()%> TO <%= reply.getToCardNo()%>


                                <form action="./first.jsp" method="post">
                                    <input type="hidden" name="name4" value=<%=cardFrom.getName()%>>
                                    <input type="hidden" name="endDate4" value=<%=cardFrom.getEndDate()%>>
                                    <input type="hidden" name="cardnumber4" value=<%=cardFrom.getCardnumber()%>>
                                    <input type="hidden" name="cvv4" value=<%=cardFrom.getCvv()%>>
                                    <input type="hidden" name="issueNumber4" value=<%=cardFrom.getIssueNumber()%>>
                                    <input type="hidden" name="amount" value=<%=reply.getAmount()%>>
                                    <input type="hidden" name="action" value="refund">
                                    <button type="submit" >Refund Transaction!</button>
                                </form>

                            </div>

                        <%} else if (reply.getStatus().equals(BankTransactionStatus.FAIL)) {%>

                        <div class="alert alert-danger" role="alert">
                            <a class="close" data-dismiss="alert" href="#">×</a>No transaction was made...Make sure the admin has set their card details!!<br>
                            <%= reply.getMessage().substring(0, 24)%>
                        </div>


                        <% }%>
                        <% } %>
                        <%if (("refund".equals(action))) {%>

                        <div  class="alert alert-success" role="alert">
                            <a class="close" data-dismiss="alert" href="#">×</a>Refund Done
                        </div>
                        <%=cardFrom%> <br>

                        <%=cardTo%> <br>

                        <% }%>



                        <form action="./first.jsp" method="post">
                            <div class="row">
                                <div class="col">
                                    
                                    <h3>Enter Your Card Details</h3>
                                    <div class="mb-2">
                                        <label for="name">Name</label>
                                        <input id="name" type="text" class="form-control" name="name1" value="test user1">
                                    </div>
                                    <div class="mb-2">
                                        <label for="enddate">End Date</label>
                                        <input id="enddate" type="text" class="form-control" name="endDate1" value="11/21">
                                    </div>
                                    <div class="mb-2">
                                        <label for="cardnum">Card Number</label>
                                        <input id="cardnum" type="text" class="form-control" name="cardnumber1" value="5133880000000012">
                                    </div>
                                    <div class="mb-2">
                                        <label for="cvv">CVV</label>
                                        <input id="cvv" type="text" class="form-control" name="cvv1" value="123">
                                    </div>
                                    <div class="mb-2">
                                        <label for="issuenum">Issuer Number</label>
                                        <input id="issuenum" type="text" class="form-control" name="issueNumber1" value="01">
                                    </div>
                                </div>

                                <div class="col">
                                    <h3>To Card</h3>
                                    
                                    <div class="mb-2">
                                        <div class="label-container">
                                            <label>End Date</label>
                                        </div>
                                        <input type="text" class="form-control" name="endDate2" value="11/21">
                                    </div>
                                    <div class="mb-2">
                                        <div class="label-container">
                                            <label>Card Number</label>
                                        </div>
                                        <input type="text" class="form-control" name="cardnumber2" value="4285860000000021">
                                    </div>
                                    <div class="mb-2">
                                        <div class="label-container">
                                            <label>CVV</label>
                                        </div>
                                        <input type="text" class="form-control" name="cvv2" value="123"">
                                    </div>
                                    <div class="mb-2">
                                        <div class="label-container">
                                            <label>Issuer Number</label>
                                        </div>
                                        <input type="text" class="form-control" name="issueNumber2" value="01">
                                    </div>
                                </div>
                                
                            </div>
                            <div class="row pt-5 pb-5 mb-5 ">
                                <div class="col">
                                    <div class="mb-2">
                                        <h3>Amount</h3>
                                        <input type="number" class="form-control" name="amount" value="50">$
                                    </div>
                                </div>

                            </div>
                            <input type="hidden" name="action" value="transaction">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>

