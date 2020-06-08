<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Huy Nguyễn
  Date: 5/10/2020
  Time: 9:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no"/>
	<title>Sign in</title>
	<link rel="stylesheet" href="<c:url value="/css/style.css"/> "/>
	<link rel="stylesheet" href="<c:url value="/css/vendor/bootstrap.min.css"/> "/>
	<link rel="icon" href="<c:url value="/img/bookingIcon.svg"/>"/>
	<link rel="stylesheet" href="<c:url value="/css/vendor/fontawesome-pro-5.13.0-web/css/all.css"/>"/>
</head>

<body class="bg-sea">
<div class="container mt-md-5 p-5">
	<div class="row justify-content-md-center pt-md-5">
		<div class="col-md-5">

			<form method="post" class="login-form p-md-5 needs-validation align-items-center">
				<h1 class=" text-center font-weight-bolder">ACCOUNT LOGIN</h1>
				<div class="form-group">
					<label for="email"><i class="far fa-user"></i></label>
					<input type="email" id="email" name="email" placeholder="Email" required/>
					<span class="focus-border"></span>
				</div>

				<div class="form-group mb-3">
					<label for="password"><i class="far fa-envelope"></i></label>
					<input type="password" id="password" name="password" placeholder="Password" required/>
					<span class="focus-border"></span>
				</div>
				<p class="text-danger"><%=request.getAttribute("error")%></p>
				<input type="submit" value="Sign In" class="form-submit">

				<div class="clearfix"></div>

				<span>Don't have account? <a href="<c:url value="/signup"/> "> Sign Up</a> <br></span>
				<span>Forgot your <a href="#">password?</a></span>
			</form>
		</div>

	</div>

</div>
</body>
</html>