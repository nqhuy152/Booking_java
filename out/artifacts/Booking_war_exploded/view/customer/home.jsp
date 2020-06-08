<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Base64" %>
<%@ page import="booking.DAO.Connect" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page
		contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>

<html lang="">

<head>
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>home</title>

	<link rel="icon" href="<c:url value="/img/bookingIcon.svg"/>"/>
	<link rel="stylesheet" href="<c:url value='/css/style.css'/>"/>
	<link rel="stylesheet" href="<c:url value='/css/vendor/bootstrap.min.css'/>"/>
	<link rel="stylesheet" href="<c:url value='/css/vendor/jquery-ui.min.css'/>"/>
	<link rel="stylesheet" href="<c:url value="/css/vendor/nice-select.css"/>"/>

</head>

<body>
<c:import url="../header.jsp"/>

<%----------------------------------------Search-------------------------------------------------------%>
<section class="search-filter">
	<div class="container py-5">
		<h4>Check Availability</h4>
		<form action="<c:url value="/category"/>" class="check-form row pt-4">
			<div class="m-auto datepicker col-lg-2 m-auto">
				<p>Location</p>
				<input type="text" name="location" id="location" placeholder="Where you go?">
			</div>
			<div class="datepicker col-lg-2 col-md-6 m-auto">
				<p>From</p>
				<input type="text" id="checkin" value="dd / mm / yyyy" name="checkin" onblur="">
				<!-- <img src="img/calendar.png" alt=""> -->
			</div>
			<div class="datepicker col-lg-2 col-md-6 m-auto">
				<p>To</p>
				<input type="text" id="checkout" value="dd / mm / yyyy" name="checkout">
				<!-- <img src="img/calendar.png" alt=""> -->
			</div>
			<div class="room-quantity col-lg-3 col-md-6 m-auto row">
				<div class="single-quantity col">
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
			<div class="room-selector col-lg-2 col-md-6 m-auto">
				<p>Room</p>
				<select class="suit-select" id="type">
					<option>Eg. Master suite</option>
					<option value="">Double Room</option>
					<option value="">Single Room</option>
					<option value="">Special Room</option>
				</select>
			</div>
			<button type="submit" class="col-lg-1 col-md-12 m-auto">Go</button>
		</form>
	</div>
</section>

<%----------------------------------------Search-------------------------------------------------------%>


<%------------------------------------------Best-chooses-----------------------------------------------%>

<section class="best-chooses">
	<div class="container py-5">
		<h4 class="section-title">Homes guests love</h4>
		<div class="row text-center">
		<%
			try {
				PreparedStatement ps = Connect.con.prepareStatement("SELECT hotel.*, i.image FROM reservation left join hotel on reservation.HID=hotel.HID left join image i on hotel.HID = i.hid " +
						"group by HID order by count(reservation.ID) desc limit 4");
				ResultSet rs = ps.executeQuery();
				int i=0;
				while (rs.next()) {
				    String a= Base64.getEncoder().encodeToString(rs.getBytes("image"));
					request.setAttribute("img"+i, a);

				%>
					<div class="col-lg-3 col-md-6 mb-4">
						<div class="card h-100">
							<img class="card-img-top" src="data:image/png;base64,<%=request.getAttribute("img"+i)%>" alt=""height="325" width="500">
							<div class="card-body">
								<h4 class="card-title"><%=rs.getString("Name")%></h4>
								<p class="card-text text-justify"><%=rs.getString("description")%></p>
							</div>
							<div class="card-footer">
								<form method="get" action="<c:url value="/hotel"/>">
									<input type="hidden" name="Hid" value="<%=rs.getString("HID")%>">
									<button class="btn btn-primary" type="submit">See More</button>
								</form>

							</div>
						</div>
					</div>
				<%i++;}
			} catch (Exception e) {
				System.out.println(e);
			}
		%>
		</div>
	</div>

</section>
<c:import url="../footer.jsp"/>


<script src="<c:url value="/js/vendor/jquery.min.js"/>"></script>
<script src="<c:url value="/js/vendor/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/vendor/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/vendor/jquery.nice-select.min.js"/>"></script>
<script src="<c:url value="/js/main.js"/>"></script>
</body>

</html>