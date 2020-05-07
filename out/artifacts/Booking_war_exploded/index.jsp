<%-- Created by IntelliJ IDEA. User: Huy Nguyễn Date: 5/6/2020 Time: 2:44 PM To
change this template use File | Settings | File Templates. --%>
<%@ page
		contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="">

<head>
	<meta charset="utf-8"/>
	<title>Booking Hotel</title>

	<link rel="icon" href="img/bookingIcon.svg"/>
	<script src="https://kit.fontawesome.com/9e19fed9b5.js" crossorigin="anonymous"></script>
	<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet"/>
	<link rel="stylesheet" type="text/css" href="css/style.css"/>
	<link rel="stylesheet" href="css/vendor/bootstrap-grid.css"/>
	<link rel="stylesheet" href="css/vendor/bootstrap.min.css"/>
</head>

<body>
<header>
	<nav class="navbar navbar-expand-lg navbar-dark header fixed-top">
		<div class="container">
			<a href="#"><img class="logo" src="img/logo2.png" alt="logo"/></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
			        aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active">
						<a class="nav-link" href="#">Home
							<span class="sr-only">(current)</span>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">List your property</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">Register</a>
					</li>
					<li class="nav-item">
						<a class="btn-light" href="#">Sign in</a>
					</li>
				</ul>
			</div>
			<%--			<div class="user_form">--%>
			<%--				<ul class="row">--%>
			<%--					<li><a href="#" id="list_property">List your property</a></li>--%>
			<%--					<li>--%>
			<%--						<button class="top_btn">Register</button>--%>
			<%--					</li>--%>
			<%--					<li>--%>
			<%--						<button class="top_btn">Sign in</button>--%>
			<%--					</li>--%>
			<%--				</ul>--%>
			<%--			</div>--%>
		</div>
	</nav>
			<!-- <ul>
		  <li>Home</li>
		</ul> -->
			<div class="clearfix"></div>
</header>


<div class="container">
	<h2>Find deals on hotels, homes, and much more...</h2>
	<div class="row text-center">
		<form action="#" method="post">
			<li class="col-lg-5">
				<input type="text" name="location" id=" " placeholder="Where are you going?"/>
			</li>
			<li class="col-lg-2">
				<input type="date" id="check_in" min="today"/>
			</li>
			<li class="col-lg-2">
				<input type="date" name="checkout" id="checkout"/>
			</li>
			<li class="col-lg-3">
				<input type="number" min="1" max="200" placeholder="How many people?"/>
			</li>
			<li class="col-lg-1">
				<input type="submit" value="Search"/>
			</li>
		</form>
		<div class="clearfix"></div>
	</div>
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
					<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo magni
						sapiente, tempore debitis beatae culpa natus architecto.</p>
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
					<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo magni
						sapiente, tempore debitis beatae culpa natus architecto.</p>
				</div>
				<div class="card-footer">
					<a href="#" class="btn btn-primary">Find Out More!</a>
				</div>
			</div>
		</div>

	</div>

	<section class="padding">
		<h2>Browse by property type</h2>
		<ul class="row">
			<li class="col span_4_of_12">
				<img src="img/ha-long.jpg" alt="ha-long"/>
			</li>
			<li class="col span_4_of_12">s</li>
			<li class="col span_4_of_12">s</li>
		</ul>
		<div class="clearfix"></div>
	</section>

	<section class="padding">
		<h2>About us</h2>
	</section>

	<form action="login.jsp" method="POST" name="login">
		<input type="text" name="email" id="email" placeholder="User name" required/><br/>
		<input type="password" name="password" id="password" placeholder="Password" required/><br/>
		<input type="submit" value="Login"/>
	</form>
</div>

<script src="js/after.js"></script>
<footer>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	        crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	        crossorigin="anonymous"></script>
</footer>
</body>

</html>