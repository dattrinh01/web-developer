<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/mystyle.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<script type="text/javascript" src="resources/js/registerValidate.js"></script>
</head>
<body>
	<main class="login-form">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-header">Register</div>
                    <div class="card-body">
                        <form method="post" action="Register" id="registerForm">
                        	<div class="form-group row">
                                    <input type="text" id="username" class="form-control" name="username" placeholder="User name" size="50">
                            </div>
                            <div class="form-group row mt-3">
                                    <input type="email" id="email" class="form-control" name="email" placeholder="E-mail" size="50">
                            </div>
                            <div class="form-group row mt-3">
                                    <input type="password" id="password" class="form-control" name="password" placeholder="Password" size="50">
                            </div>
                            <div class="form-group row mt-3">
                                    <input type="password" id="repassword" class="form-control" name="repassword" placeholder="Re Password">
                            </div>
                            <div class="form-group row">
                            	<span style="color: red;">${error}</span>
                            </div>
                            <div class="form-group row mt-3">
                                	<button type="submit" id="submit" class="btn btn-primary">Register</button>
                            </div>
                            <a href="login.jsp" class="btn btn-link mt-3">Click here to Login</a>
                    	</form>
                    </div>
                		</div>
            		</div>
        		</div>
    		</div>
	</main>
</body>
</html>