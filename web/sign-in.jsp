<%--
  Created by IntelliJ IDEA.
  User: Huy Nguyễn
  Date: 5/10/2020
  Time: 9:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<title>Sign in</title>
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/vendor/bootstrap.css">
</head>

<body>
<div class="box">
	<form method="post" action="" class="login-form">
		<h1>ACCOUNT LOGIN</h1>
		<div class="input-box">
			<input type="email" name="email" placeholder="    Email" class="input-effect"/>
			<span class="focus-border"></span>
		</div>

		<div class="input-box">
			<input type="password" name="password" placeholder="    Password" class="input-effect"/>
			<span class="focus-border"></span>
		</div>


		<input type="submit" value="Sign In" class="submit">
		<div class="clearfix"></div>

		<span>Don't have account? <a href="#"> Sign Up</a> <br></span>
		<span>Forgot your <a href="#">password?</a></span>
	</form>
</div>


</body>

</html>
