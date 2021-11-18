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

    //String bankUrl = "http://localhost:8080/bank/rest/";
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
        String endDate2 = propertiesDao.getProperty("org.solent.ood.creditcardchecker.dao.endDate");
        String cardnumber2 = propertiesDao.getProperty("org.solent.ood.creditcardchecker.dao.cardNum");
        String cvv2 = propertiesDao.getProperty("org.solent.ood.creditcardchecker.dao.cvv");
        String issueNumber2 = propertiesDao.getProperty("org.solent.ood.creditcardchecker.dao.issueNum");
        cardTo = new CreditCard();
        cardTo.setEndDate(endDate2);
        cardTo.setCardnumber(cardnumber2);
        cardTo.setCvv(cvv2);
        cardTo.setIssueNumber(issueNumber2);
        //Amount
        Double amount = Double.valueOf(request.getParameter("amount"));

        reply = client.transferMoney(cardFrom, cardTo, amount);
//        if (session.getAttribute("sessionUser") == null) {
//            System.out.println("TRANFIERE SIN AUTENTICAR");
//            reply = client.transferMoney(cardFrom, cardTo, amount);
//
//        } else {
//            System.out.println("SI TRANFIERE CON AUTENTICAR");
//            System.out.println(user);
//            System.out.println(password);
//            System.out.println((String)session.getAttribute("sessionUser"));
//            System.out.println((String)session.getAttribute("sessionPassword"));
//            reply = client.transferMoney(cardFrom, cardTo, amount,(String)session.getAttribute("sessionUser"), (String)session.getAttribute("sessionPassword"));
//            if (reply.getStatus() == null) {
//                reply.setStatus(BankTransactionStatus.FAIL);
//            }
//
//        }
//        System.out.println(reply);

    } else if ("refund".equals(action)) {

        //Card To
        String endDate3 = propertiesDao.getProperty("org.solent.ood.creditcardchecker.dao.endDate");
        String cardnumber3 = propertiesDao.getProperty("org.solent.ood.creditcardchecker.dao.cardNum");
        String cvv3 = propertiesDao.getProperty("org.solent.ood.creditcardchecker.dao.cvv");
        String issueNumber3 = propertiesDao.getProperty("org.solent.ood.creditcardchecker.dao.issueNum");
        cardFrom = new CreditCard();
        cardFrom.setEndDate(endDate3);
        cardFrom.setCardnumber(cardnumber3);
        cardFrom.setCvv(cvv3);
        cardFrom.setIssueNumber(issueNumber3);

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
        Double amount = Double.valueOf(request.getParameter("amount"));
        reply = client.transferMoney(cardFrom, cardTo, amount);
    } else if ("logout".equals(action)) {
        session.setAttribute("isUserLoggedIn", false);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/Footer-Basic.css">
        <link rel="stylesheet" href="assets/css/styles.css">
        <link rel="stylesheet" href="assets/css/easy-numpad.css">

        <title>Main Page</title>

        <script>

            var txt;
            var label;
            var full = false;
            var index = 0;

            var nextBtn;
            var backBtn;
            var transactionForm;

            var cardNumber;
            var endDate;
            var cvv;
            var issueNumber;
            var amount;



            function checkIndex(event) {

                if (index == 0) {
                    document.getElementById("label").innerHTML = "Enter card number:";
                    txt.value = cardNumber.value;
                } else if (index == 1) {
                    document.getElementById("label").innerHTML = "Enter End Date:";
                    txt.value = endDate.value;
                } else if (index == 2) {
                    document.getElementById("label").innerHTML = "Enter CVV:";
                    txt.value = cvv.value;
                } else if (index == 3) {
                    document.getElementById("label").innerHTML = "Enter Issue Number";
                    txt.value = issueNumber.value;
                } else if (index == 4) {
                    document.getElementById("label").innerHTML = "Enter Amount:";
                    txt.value = amount.value;

                    

                }
            }

            function saveData(event) {
                if (index == 0) {
                    cardNumber.value = txt.value;
                } else if (index == 1) {
                    endDate.value = txt.value;
                } else if (index == 2) {
                    cvv.value = txt.value;
                } else if (index == 3) {
                    issueNumber.value = txt.value;
                } else if (index == 4) {
                    amount.value = txt.value;
                }
                txt.value = "";
            }

            function nextBtn(event) {
                if (index >= 4) {
                    saveData();
                    transactionForm.submit();
                } else {

                    saveData();
                    index++;
                    checkIndex();
                }


            }

            function backBtn(event) {
                if (index <= 0) {

                } else {
                    saveData();
                    index--;
                    checkIndex();
                }


            }


            function pulseN(event) {
               txt.value += event.target.value;
            }

            function pulseClear(event) {
                txt.value = "";
            }

            function asignarEventos(evento) {
                if (document.readyState == 'complete') {

                    numbers = document.getElementsByClassName("number");
                    for (i = 0; i < numbers.length; i++) {
                        numbers[i].addEventListener('click', pulseN, false);
                    }

                    txt = document.getElementById("txt");
                    label = document.getElementById("label");

                    document.getElementById("backBtn").addEventListener('click', backBtn);
                    document.getElementById("nextBtn").addEventListener('click', nextBtn);
                    document.getElementById("clearBtn").addEventListener('click', pulseClear);

                    transactionForm = document.getElementById("transactionForm");
                    

                    cardNumber = document.getElementById("cardnumber1");
                    endDate = document.getElementById("endDate1");
                    cvv = document.getElementById("cvv1");
                    issueNumber = document.getElementById("issueNumber1");
                    amount = document.getElementById("amount");

                }
            }
            document.addEventListener('readystatechange', asignarEventos);
        </script>
    </head>
    <body>
        <div class="row card-body align-items-center justify-content-center ">
            <div class="col-sm-10">
                <div class="card shadow-lg">
                    <div class="card-body">

                        <form action="./keypad.jsp" method="post" id="transactionForm">
                            <h1 id="label">Enter card number:<br></h1>
                            <input type="text" name="text" readonly="true"  id="txt">

                            <div>
                                <input type="hidden" name="cardnumber1" class="inputCard"  id="cardnumber1">
                                <input type="hidden" name="endDate1" class="inputCard"  id="endDate1" >
                                <input type="hidden" name="cvv1" class="inputCard"  id="cvv1" >
                                <input type="hidden" name="issueNumber1" class="inputCard"  id="issueNumber1" >
                                <input type="hidden" name="amount" class="inputCard"   id="amount" >
                                <input type="hidden" name="action" value="transaction">
                            </div>
                        </form>

                        <!-- refund -->
                        <% if (("transaction".equals(action))) {%>

                        <h6><%= reply.toString()%> <br></h6>

                        <% if (reply.getStatus().equals(BankTransactionStatus.SUCCESS)) {%>

                        <div class="alert alert-info">
                            <a class="close" data-dismiss="alert" href="#">×</a>
                            £<%= reply.getAmount()%> WERE SUCCESSFULLY TRANSFERRED FROM <%= reply.getFromCardNo()%> TO <%= reply.getToCardNo()%>


                            <form action="./keypad.jsp" method="post">
                                <input type="hidden" name="name2" value=<%=cardFrom.getName()%>>
                                <input type="hidden" name="endDate2" value=<%=cardFrom.getEndDate()%>>
                                <input type="hidden" name="cardnumber2" value=<%=cardFrom.getCardnumber()%>>
                                <input type="hidden" name="cvv2" value=<%=cardFrom.getCvv()%>>
                                <input type="hidden" name="issueNumber2" value=<%=cardFrom.getIssueNumber()%>>
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


                        <!-- payment --><!--
                        <form action="./keypad.jsp" method="post">
                            <h1 id="label">Enter card number:<br></h1>

                            <div>
                                <input type="text" name="cardnumber1" class="easy-put"  id="txt" >
                                <input type="hidden" name="endDate1" class="easy-put"  id="1" >
                                <input type="hidden" name="cvv1" class="easy-put"  id="2" >
                                <input type="hidden" name="issueNumber1" class="easy-put"  id="3" >
                                <input type="hidden" name="amount" class="easy-put"   id="4" >
                            </div>

                            <div class="row" id="invisibleDiv">


                            </div>

                            <input type="hidden" name="action" value="transaction">
                            <button type="button" id="btnKeyPad" class="btn btn-primary">Submit</button>
                            <button type="submit" onclick="callStoredValues()" class="btn btn-primary" id="btnTransaction">Initiate Transaction</button>
                        </form>
                        -->
                        <!-- numpad -->
                        <div id="numpad" class="text-center">
                            <div class="btn-group btn-group-lg" role="group">
                                <input type="button" name="1" id="1" value="1" class="number btn btn-secondary">
                                <input type="button" name="2" id="2" value="2" class="number btn btn-secondary">
                                <input type="button" name="3" id="3" value="3" class="number btn btn-secondary">

                            </div>
                            <br>
                            <div class="btn-group btn-group-lg" role="group">
                                <input type="button" name="4" id="4" value="4" class="number btn btn-secondary">
                                <input type="button" name="5" id="5" value="5" class="number btn btn-secondary">
                                <input type="button" name="6" id="6" value="6" class="number btn btn-secondary">
                            </div>
                            <br>
                            <div class="btn-group btn-group-lg" role="group">
                                <input type="button" name="7" id="7" value="7" class="number btn btn-secondary">
                                <input type="button" name="8" id="8" value="8" class="number btn btn-secondary">
                                <input type="button" name="9" id="9" value="9" class="number btn btn-secondary">
                            </div>
                            <br>
                            <div class="btn-group btn-group-lg" role="group">
                                <input type="button" name="dot" id="dot" value="." class="number btn ">
                                <input type="button" name="0" id="0" value="0" class="number btn btn-secondary">
                                <input type="button" name="slash" id="slash" value="/" class="number btn">
                            </div>
                            <br>
                            <div class="btn-group btn-group-lg" role="group">

                                <input type="button" name="clearBtn" id="clearBtn" value="Clear" class="btn btn-danger">
                                <input type="button" name="backBtn" id="backBtn" value="Back" class="btn btn-danger">
                                <input type="button" name="nextBtn" id="nextBtn" value="Next" class="btn btn-secondary">
                                




                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>

    </body>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
            crossorigin="anonymous">
    </script>
    <script src="assets/js/easy-numpad.js"></script>
    <script src="assets/js/keypad-form.js"></script>
</html>

