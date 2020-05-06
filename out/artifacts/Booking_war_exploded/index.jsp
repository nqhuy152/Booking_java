<%--
  Created by IntelliJ IDEA.
  User: Huy Nguyễn
  Date: 5/6/2020
  Time: 2:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="">

<head>
  <meta charset="utf-8" />
  <title>Booking Hotel</title>
  
  <link rel="icon" href="img/bookingIcon.svg" />
  <script src="https://kit.fontawesome.com/9e19fed9b5.js" crossorigin="anonymous"></script>
  <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <link rel="stylesheet" href="css/vendor/grid.css" />

  <!-- <meta name="theme-color" content="#fafafa"> -->
</head>

<body>
<header class="header padding">
  <a href="#"><img class="logo" src="img/logo2.png" alt="logo" /></a>
  <div class="user_form">
    <ul class="row">
      <li><a href="#" id="list_property">List your property</a></li>
      <li><button class="top_btn">Register</button></li>
      <li><button class="top_btn">Sign in</button></li>
    </ul>
  </div>

  <!-- <ul>
	<li>Home</li>
  </ul> -->
  <div class="clearfix"></div>
</header>
<section class="find padding" name="Search">
  <h2>Find deals on hotels, homes, and much more...</h2>
  <div>
    <form action="#" method="post">
      <li class="col span_4_of_12">
        <input type="text" name="location" id=" " placeholder="Where are you going?" />
      </li>
      <li class="col span_2_of_12">
        <input type="date" id="check_in" min=today/>
      </li>
      <li class="col span_2_of_12"><input type="date" name="checkout" id="checkout"/></li>
      <li class="col span_3_of_12">
        <input type="number" min="1" max="200" placeholder="How many people?"/>
      </li>
      <li class="col span_1_of_12">
        <input type="submit" value="Search" />
      </li>
    </form>
  </div>
  <div class="clearfix"></div>
</section>
<section class="padding">
  <h2>Browse by property type</h2>
  <ul class="row">
    <li class="col span_4_of_12"><img src="img/ha-long.jpg" alt="ha-long"></li>
    <li class="col span_4_of_12">s</li>
    <li class="col span_4_of_12">s</li>
  </ul>
  <div class="clearfix"></div>
</section>

<section class="padding">
  <h2>About us</h2>
</section>

<form action="login.jsp" method="POST" name="login">
  <input type="text" name="email" id="" placeholder="User name" required /><br />
  <input type="password" name="password" id="" placeholder="Password" required /><br />
  <input type="submit" value="Login" />
</form>
<script src="js/after.js"></script>
</body>

</html>
