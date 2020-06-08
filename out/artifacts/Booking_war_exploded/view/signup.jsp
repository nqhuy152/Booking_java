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
<div class="container mt-5 p-5">
		<div class="row m-5 justify-content-md-center">
			<div class="col-md-6">

				<form method="post" class="login-form p-md-5" id="register-form" name="signup" enctype="multipart/form-data">
					<h1 class="form-title">Sign up</h1>

					<div class="form-group">
						<label for="name"><i class="fas fa-user"></i></label>
						<input type="text" name="name" id="name" placeholder="Your Name" required/>
						<span class="focus-border"></span>
					</div>

					<div class="form-group">
						<label for="email"><i class="far fa-envelope"></i></label>
						<input type="email" name="email" id="email" placeholder="Your Email" onblur="checkExist()" required/>
						<span class="focus-border"></span>
						<span id="isE" style="text-align: start"></span>
					</div>
					<div class="form-group">
						<label for="pass"><i class="fas fa-unlock"></i></label>
						<input type="password" name="pass" id="pass" placeholder="Password" required/>
						<span class="focus-border"></span>
					</div>
					<div class="form-group">
						<label for="re_pass"><i class="far fa-unlock"></i></label>
						<input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password" required/>
						<span class="focus-border"></span>
					</div>

					<div class="form-group">
						<label for="phone"><i class="fas fa-phone-alt"></i></label>
						<input type="number" name="phone" id="phone" placeholder="Phone number" required/>
						<span class="focus-border"></span>
					</div>
					<div class="form-group">
						<label for="DoB"><i class="fad fa-birthday-cake"></i></label>
						<input type="date" name="DoB" id="DoB" placeholder="Your Birthday" required/>
						<span class="focus-border"></span>
					</div>
					<div class="form-group">
						<label for="role"><i class="fad fa-user-tag"></i></label>
						<select class="" id="role" name="role" required>
							<option selected>Choose...</option>
							<option value="customer">customer</option>
							<option value="hotel manager">hotel manager</option>
						</select>
						<span class="focus-border"></span>
					</div>
					<div class="form-group">
						<label for="bank"><i class="fad fa-money-check-alt"></i></label>
						<input type="number" name="bank" id="bank" placeholder="Your Bank Number" required/>
						<span class="focus-border"></span>
					</div>

					<div class="form-group mt-4">
						<label for="avatar" class="custom-file-label"><i class="fal fa-user-circle" style="top: 0; left: -5px" >    Avatar</i></label>

						<input type="file" name="avatar" id="avatar" accept="image/*" class="custom-file-input" required/>
					</div>


					<div class="term mt-4">
						<input type="checkbox" name="agree-term" id="agree-term" class="agree-term" required/>
						<label for="agree-term" class="label-agree-term">I agree all statements in <a href="#">Terms of service</a></label>
					</div>
					<input type="submit" name="signup" id="signup" class="form-submit" value="Register" />
				</form>
			</div>
		</div>
</div>
<FOOTER>
	<script>
        var password = document.getElementById("pass")
            , confirm_password = document.getElementById("re_pass");

        function validatePassword(){
            if(password.value !== confirm_password.value) {
                confirm_password.setCustomValidity("Passwords Don't Match");
            } else {
                confirm_password.setCustomValidity('');
            }
        }

        password.onchange = validatePassword;
        confirm_password.onblur = validatePassword;

        function checkExist(){
            var xmlhttp = new XMLHttpRequest();
            var username = document.getElementById("email").value;
            var url = "<c:url value="/view/exits.jsp?email="/>" + username;
            xmlhttp.onreadystatechange = function(){
                if(xmlhttp.readyState === 4 && xmlhttp.status === 200){
                    document.getElementById("isE").innerHTML = xmlhttp.responseText;
                    if(document.getElementById("isE").innerText === "Email is valid")
                        document.getElementById("isE").style.color = "green";
                    else
                        document.getElementById("isE").style.color = "red";
                }

            };
            try{
                xmlhttp.open("GET",url,true);
                xmlhttp.send();
            }catch(e){alert("unable to connect to server");
            }}
	</script>
</FOOTER>
</body>
</html>