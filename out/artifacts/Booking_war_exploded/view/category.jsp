<%@ page import="booking.DAO.listHotel" %>
<%@ page import="booking.model.hotel" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Base64" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Huy Nguyễn
  Date: 6/2/2020
  Time: 5:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Search</title>
	<link rel="icon" href="<c:url value="/img/bookingIcon.svg"/>"/>
	<link rel="stylesheet" href="<c:url value="/css/style.css"/> "/>
	<link rel="stylesheet" href="<c:url value="/css/vendor/bootstrap.min.css"/> "/>
	<link rel="stylesheet" href="<c:url value="/css/vendor/fontawesome-pro-5.13.0-web/css/all.css"/>"/>
	<link rel="stylesheet" href="<c:url value='/css/vendor/jquery-ui.min.css'/>"/>
	<link rel="stylesheet" href="<c:url value="/css/vendor/nice-select.css"/>"/>
</head>
<body>

<c:import url="header.jsp"/>

<div class="container bg-white min-vh-100">
	<div class="row py-5">
		<nav class="col-md-3 search align-items-centerpy-3">
			<form class="check-form row bg-white py-3 rounded" action="<c:url value="/category"/>">
				<h4 class="m-auto">Check Availability</h4>
				<div class="m-auto datepicker w-100">
					<p>Location</p>
					<input type="text" name="location" id="location" placeholder="Where you go?">
				</div>
				<div class="datepicker col-md-6 pr-md-2">
					<p>From</p>
					<input type="text" id="checkin" value="DD / MM / YYYY" name="checkin">
				</div>
				<div class="datepicker col-md-6 pl-md-2">
					<p>To</p>
					<input type="text" id="checkout" value="DD / MM / YYYY" name="checkout">
				</div>
				<div class="room-quantity m-auto row">
					<div class="single-quantity col m-auto">
						<p>Adults</p>
						<div class="pro-qty"><input type="number" value="0" id="adults" name="adults"></div>
					</div>
					<div class="single-quantity col">
						<p>Children</p>
						<div class="pro-qty"><input type="number" value="0" aria-valuemin="0" id="children" name="children">
						</div>
					</div>
					<div class="single-quantity last col">
						<p>Rooms</p>
						<div class="pro-qty ml-auto"><input type="number" value="0" aria-valuemin="0" id="room" name="room"></div>
					</div>
				</div>
				<div class="room-selector m-auto w-100">
					<p>Room</p>
					<select class="suit-select" name="type">
						<option selected="selected">Eg. Master suite</option>
						<option value="">Double Room</option>
						<option value="">Single Room</option>
						<option value="">Special Room</option>
					</select>
				</div>
				<button type="submit" class="mx-auto px-5 py-3 rounded-pill">Go</button>
			</form>
		</nav>
		<div class="col-md-9">
			<div class="row bg-white">
		<%
			int c=0;
			List<hotel> lH= listHotel.getHotels();
			for (hotel hotel:
			     lH) {
				String img= Base64.getEncoder().encodeToString(hotel.getImag());
				request.setAttribute("im"+c, img);
		%>
				<div class="col-md-4">
					<div class="card mb-4 box-shadow">
						<img class="card-img-top" src="data:image/png;base64,<%=request.getAttribute("im"+c)%>" alt="Thumbnail [100%x225]" style="height: 225px; width: 100%; display: block;" data-holder-rendered="true">
						<div class="card-body">
							<h4 class="card-title" style="height: 50px"><%=hotel.getName()%></h4>
							<p class="card-text limit-text"><%=hotel.getDescription()%></p>
							<div class="d-flex justify-content-between align-items-center">
								<form method="get" action="<c:url value="/hotel"/>">
									<input type="hidden" name="Hid" value="<%=hotel.getId()%>">
									<button type="submit" class="btn btn-sm btn-outline-secondary">View</button>
								</form>
								<small class="text-muted">value</small>
							</div>
						</div>
					</div>
				</div>
		<%c++;}%>

			</div>
		</div>
	</div>
</div>
<c:import url="./footer.jsp"/>
<footer>
	<script src="<c:url value="/js/vendor/jquery.min.js"/>"></script>
	<script src="<c:url value="/js/vendor/jquery-ui.min.js"/>"></script>
	<script src="<c:url value="/js/vendor/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/js/vendor/jquery.nice-select.min.js"/>"></script>
	<script src="<c:url value="/js/main.js"/>"></script>
</footer>
</body>
</html>