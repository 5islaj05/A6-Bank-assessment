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
    <body style="opacity: 1;height: 100vh;font-size: 16px;">
    <div class="container mt-2">
	<div class="row justify-content-center align-items-center text-center p-2">
		<div class="m-1 col-sm-8 col-md-6 col-lg-4 shadow-sm p-3 mb-5 bg-white border rounded">
			<div class="pt-5 pb-5">
				<p class="text-center text-uppercase mt-3">Would you like to set your bussinnes bank account?</p>
				<form class="form text-center" action="#" method="POST">
					<div class="form-group input-group-md">
						<input type="text" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
						<!--<div class="invalid-feedback">
							 Errors in email during form validation, also add .is-invalid class to the input fields
						</div> -->
					</div>
					<div class="form-group input-group-md">
						<input type="password" class="form-control" id="password" placeholder="Password">
						<!--<div class="invalid-feedback">
							 Errors in password during form validation, also add .is-invalid class to the input fields
						</div> -->
					</div>
					<button class="btn btn-lg btn-block btn-primary mt-4" type="submit">
                        Login
               </button>
					<a href="#" class="float-right mt-2">Forgot Password? </a>
				</form>
			</div>
			<a href="#" class="text-center d-block mt-2">Create an account? </a>
		</div>
	</div>
</div>
</body>

</html>