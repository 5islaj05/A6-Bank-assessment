<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<%-- 
    Document   : index
    Created on : 13 nov. 2021, 8:40:28
    Author     : guill
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                    <p class="text-center text-uppercase mt-3">Would you like to log in with your bank details?</p>
                    <form class="form " action="./first.jsp" method="POST">
                        <div class="form-group input-group-md">
                            <div class="label-container">
                                <label>User</label>
                            </div>
                            <input type="text" class="form-control" name="user" value="testuser2">

                        </div>
                        <div class="form-group input-group-md">
                            <div class="label-container">
                                <label>Password</label>
                            </div>
                            <input type="password" class="form-control" name="password" value="defaulttestpass">
                        </div>
                        <button class="btn btn-lg btn-block btn-primary mt-4" type="submit">
                            Login
                        </button>
                        <a href="./first.jsp" class="btn btn-lg btn-block btn-success mt-4" role="button">Continue without loging</a>

                    </form>
                </div>
            </div>
        </div>
    </body>

</html>