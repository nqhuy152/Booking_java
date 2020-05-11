
<%@ page
		contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="">

<head>
	<meta charset="utf-8"/>
	<title>Booking Hotel</title>

	<link rel="icon" href="img/bookingIcon.svg"/>
	<%--	<script src="https://kit.fontawesome.com/9e19fed9b5.js" crossorigin="anonymous"></script>--%>
	<%--	<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet" />--%>

	<link rel="stylesheet" href="css/vendor/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/vendor/jquery-ui.min.css">
	<link rel="stylesheet" href="css/vendor/nice-select.css">
	<link rel="stylesheet" href="css/style.css"/>
</head>

<body>
<header class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a href="#"><img class="logo" src="img/logo2.png" alt="logo"/></a>
			<a class="btn btn-primary" href="sign-in.jsp">Sign in</a>
		</div>
</header>

<%----------------------------------------Search-------------------------------------------------------%>
<section class="search-filter">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<form action="#" class="check-form">
					<h4 class="section-title">Check Availability</h4>
					<div class="datepicker">
						<p>From</p>
						<input type="text" id="checkin" value="dd / mm / yyyy" name="checkin">
						<img src="img/calendar.png" alt="" hidden>
					</div>
					<div class="datepicker">
						<p>To</p>
						<input type="text" id="checkout" value="dd / mm / yyyy">
						<img src="img/calendar.png" alt="">
					</div>
					<div class="room-quantity">
						<div class="single-quantity">
							<p>Adults</p>
							<div class="pro-qty"><input type="number" value="0" id="adults"></div>
						</div>
						<div class="single-quantity">
							<p>Children</p>
							<div class="pro-qty"><input type="number" value="0" aria-valuemin="0" id="children">
							</div>
						</div>
						<div class="single-quantity last">
							<p>Rooms</p>
							<div class="pro-qty"><input type="number" value="0" aria-valuemin="0" id="room"></div>
						</div>
					</div>
					<div class="room-selector">
						<p>Room</p>
						<select class="suit-select">
							<option>Eg. Master suite</option>
							<option value="">Double Room</option>
							<option value="">Single Room</option>
							<option value="">Special Room</option>
						</select>
					</div>
					<button type="submit">Go</button>
				</form>
			</div>
		</div>
	</div>
</section>

<%----------------------------------------Search-------------------------------------------------------%>


<%------------------------------------------Best-chooses-----------------------------------------------%>

<section class="best-chooses">
	<div class="container">
		<h4 class="section-title">Homes guests love</h4>
		<div class="row text-center">

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="http://placehold.it/500x325" alt="">
					<div class="card-body">
						<h4 class="card-title">Card title</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse
							necessitatibus neque.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Find Out More!</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="http://placehold.it/500x325" alt="">
					<div class="card-body">
						<h4 class="card-title">Card title</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo
							magni sapiente, tempore debitis beatae culpa natus architecto.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Find Out More!</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="http://placehold.it/500x325" alt="">
					<div class="card-body">
						<h4 class="card-title">Card title</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse
							necessitatibus neque.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Find Out More!</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="http://placehold.it/500x325" alt="">
					<div class="card-body">
						<h4 class="card-title">Card title</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo
							magni sapiente, tempore debitis beatae culpa natus architecto.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Find Out More!</a>
					</div>
				</div>
			</div>

		</div>
	</div>

	</section>
<%------------------------------------------Best-chooses-----------------------------------------------%>

<%--	<form action="login.jsp" method="POST" name="login">--%>
<%--		<input type="text" name="email" id="email" placeholder="User name" required/><br/>--%>
<%--		<input type="password" name="password" id="password" placeholder="Password" required/><br/>--%>
<%--		<input type="submit" value="Login"/>--%>
<%--	</form>--%>
<%--</div>--%>


<footer class="py-3 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright © Your Website 2019</p>
	</div>

</footer>

<script src="js/vendor/jquery.min.js"></script>
<script src="js/vendor/bootstrap.min.js"></script>
<script src="js/vendor/jquery-ui.min.js"></script>
<script src="js/vendor/jquery.nice-select.min.js"></script>
<script src="js/main.js"></script>
</body>

</html>