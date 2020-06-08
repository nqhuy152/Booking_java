<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="booking.model.review" %>
<%@ page import="booking.DAO.reviews" %>
<%@ page import="java.util.Base64" %>
<%@ page import="booking.model.room" %>
<%@ page import="booking.DAO.rooms" %>
<%@ page import="booking.DAO.Connect" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Huy Nguyễn
  Date: 5/13/2020
  Time: 9:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%

	int a = 0,b=0,c=0,d=0,e =0;
	for (review review :
			reviews.getReviews()) {
		if(review.getRate()==1)
			a++;
		else if (review.getRate()==2)
			b++;
		else if (review.getRate()==3)
			c++;
		else if (review.getRate()==4)
			d++;
		else if (review.getRate()==5)
			e++;
	}
	double avg = Math.round((a+b*2+c*3+d*4+e*5)*10.0/(a+b+c+d+e))/10.0;

	try {
		PreparedStatement ps = Connect.con.prepareStatement("SELECT * FROM hotel JOIN services ON hotel.HID = services.HID where hotel.HID=?");
		ps.setString(1, (String) request.getAttribute("Hid"));
		ResultSet rs = ps.executeQuery();
		rs.next();
		ps=Connect.con.prepareStatement("SELECT * FROM image where hid=?");
		ps.setString(1, (String) request.getAttribute("Hid"));
		ResultSet rs2=ps.executeQuery();

%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title><%=rs.getString("Name")%></title>
	<link rel="icon" href="<c:url value="/img/bookingIcon.svg"/>"/>
	<link rel="stylesheet" href="<c:url value='/css/vendor/bootstrap.min.css'/>"/>
	<link rel="stylesheet" href="<c:url value="/css/vendor/font-awesome.min.css"/>"/>
	<link rel="stylesheet" href="<c:url value='/css/vendor/jquery-ui.min.css'/>"/>
	<link rel="stylesheet" href="<c:url value="/css/vendor/nice-select.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/css/vendor/lightslider.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/css/vendor/fontawesome-pro-5.13.0-web/css/all.css"/>"/>

	<link rel="stylesheet" href="<c:url value="/css/style.css"/> "/>
<style>
	/*-----------------------------------hotelPage----------------*/
	.des{
		list-style: disc;
	}
	.checked{
		color: orange;
	}
	ul{
		list-style: none outside none;
		padding-left: 0;
		margin: 0;
	}
	.demo .item{
		margin-bottom: 60px;
	}
	.content-slider li{
		background-color: #ed3020;
		text-align: center;
		color: #FFF;
	}
	.content-slider h3 {
		margin: 0;
		padding: 70px 0;
	}
	.demo{
		width: 100%;
	}
</style>
</head>

<body>
<c:import url="header.jsp"/>

<div class="container">
	<div class="container-fluid py-5">
		<div class="row quick-view bg-white py-5">
			<div class="col-md-6">
				<div class="demo">
					<div class="item">
						<div class="clearfix" style="max-width:474px;">
							<ul id="image-gallery" class="gallery list-unstyled cS-hidden">

								<%int count=0;
									while (rs2.next()) {
										String img= Base64.getEncoder().encodeToString(rs2.getBytes("image"));
										request.setAttribute("im"+count, img);%>
										<li data-thumb="data:image/png;base64,<%=request.getAttribute("im"+count)%>">
											<img src="data:image/png;base64,<%=request.getAttribute("im"+count)%>" width="100%" />
										</li>
								<%count++;}%>




							</ul>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<h2><strong><%=rs.getString("Name")%></strong></h2>
				<div class="rating">
					<div class="stars">
						<%for (int i = 0; i < Math.round(avg); i++) {%>
						<span class="fa fa-star checked"></span>
						<%}%>

						<%for (int i = 5; i > Math.round(avg); i--) {%>
						<span class="fa fa-star"></span>
						<%}%>
					</div>
					<span class="review-no"><%=a+b+c+d+e%> reviews</span>
				</div>
				<p>Address: <%=rs.getString("address")%><br>
					Phone Number: <%=rs.getString("phone")%>
				</p>
				<h4 class="price">Average price: <span><%
					int price=0;
					for (room room :
							rooms.getRooms()) {
						price+=room.getPrice();
					}%><%=price/rooms.getRooms().size()%> VNĐ</span></h4>
				<c:if test="${not empty user}">
				<form class="check-form row justify-content-around" action="<c:url value="/hotel"/>" method="post">
					<div class="room-quantity col-4">
						<%for (room room :
								rooms.getRooms()) {%>
						<div class="single-quantity">
							<p><%=room.getType()%></p><input class="value" value="<%=room.getPrice()%>" hidden>
							<input class="roomNum" type="number" value="0" id="<%=room.getType()%>" name="<%=room.getType()%>" onblur="updateTotal()">
						</div>

						<%}%>
						<input id="Hid" name="Hid" type="text" value="<%=request.getParameter("Hid")%>" hidden>
						<div class="datepicker p-0">
							<p>From</p>
							<input type="text" id="checkin" value="dd / mm / yyyy" name="checkin">
							<!-- <img src="img/calendar.png" alt=""> -->
						</div>
						<div class="datepicker p-0">
							<p>To</p>
							<input type="text" id="checkout" value="dd / mm / yyyy" name="checkout">
							<!-- <img src="img/calendar.png" alt=""> -->
						</div>
					</div>
					<div class="col-5 mt-3">
						<p id="total">Total: 0</p>
						<button type="submit">Book</button>
					</div>
				</form>
				</c:if>
			</div>



		</div>
	</div>
</div>

<div class="container mb-5 bg-white py-3">
	<nav>
		<div class="nav nav-tabs" id="nav-tab" role="tablist">
			<a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab"
			   aria-controls="nav-home" aria-selected="true">Description</a>
			<a class="nav-item nav-link" id="nav-room-tab" data-toggle="tab" href="#nav-room" role="tab"
			   aria-controls="nav-profile" aria-selected="false">Profile</a>
			<a class="nav-item nav-link" id="nav-review-tab" data-toggle="tab" href="#nav-review" role="tab"
			   aria-controls="nav-review" aria-selected="false">Review</a>
		</div>
	</nav>
	<div class="tab-content my-3" id="nav-tabContent">
		<div class="tab-pane fade show active px-3" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
			<h3><strong>Description</strong></h3>
			<div class="container ">
				<%=rs.getString("Description")%>
			</div>

			<h3><strong>Time</strong></h3>
			<div class="container">
				<p>Check In: <%=rs.getString("check-in-from")%> - <%=rs.getString("check-in-until")%> </p>
				<p>Check Out: <%=rs.getString("check-out-from")%> - <%=rs.getString("check-out-until")%> </p>
			</div>
			<h3><strong>Services</strong></h3>
			<div class="container">
				<ul class="des">
					<%if(rs.getBoolean("parking")){
						%>
					<li>Parking</li>
					<%;}if(rs.getBoolean("non-smoking rooms")){%>
					<li>Non-smoking rooms</li>

					<%;}if(rs.getBoolean("Air condition")){%>
					<li>Air condition</li><%;}%>

					<li>Daily housekeeping: <%=rs.getString("Daily housekeeping")%></li>

					<%if(rs.getBoolean("Internet")){%>
					<li>Internet</li><%;}%>

					<li>Transportation: <%=rs.getString("Transportation")%></li>

					<%if(rs.getBoolean("Pet")){%>
					<li>Pet</li><%;}%>

				</ul>
			</div>
			<h3><strong>Rules</strong></h3>
			<div class="container">
				<%=rs.getString("rules")%>
			</div>
		</div>

		<div class="tab-pane fade" id="nav-room" role="tabpanel" aria-labelledby="nav-room-tab">
			<%
				for (room room:
						rooms.getRooms()) {
			%>
				<div class="container my-3">
					<h3><strong><%=room.getType()%></strong></h3>
					<p>Description: <%=room.getDescription()%></p>
					<p>Square: <%=room.getSquare()%>m2</p>
					<p>Price: <%=room.getPrice()%> VNĐ</p>
				</div>
			<%}%>
		</div>

		<div class="tab-pane fade" id="nav-review" role="tabpanel" aria-labelledby="nav-review-tab">
			<div class="row mt-4 justify-content-around">
				<div class="col-sm-4">
					<div class="rating-block">
						<h4>Average user rating</h4>

						<h2 class="bold padding-bottom-7"><%=avg%> <small>/ 5</small></h2>


						<div class="stars">
						<%for (int i = 0; i < Math.round(avg); i++) {%>
							<span class="fa fa-star checked"></span>
						<%}%>

						<%for (int i = 5; i > Math.round(avg); i--) {%>
							<span class="fa fa-star"></span>
						<%}%>
						</div>
					</div>
				</div>
				<div class="col-sm-6 align-items-center">
					<h4>Rating breakdown</h4>
					<div class="pull-left mx-1 col-md-5 ">
						<div class="pull-left mx-1"><%=e%></div>
						<div class="pull-left mx-1">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
						</div>

					</div>
					<div class="pull-left mx-1 col-md-5">
						<div class="pull-left mx-1"><%=d%></div>
						<div class="pull-left mx-1">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
						</div>

					</div>
					<div class="pull-left mx-1 col-md-5">
						<div class="pull-left mx-1"><%=c%></div>
						<div class="pull-left mx-1">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
						</div>

					</div>
					<div class="pull-left mx-1 col-md-5">
						<div class="pull-left mx-1"><%=b%></div>
						<div class="pull-left mx-1" >
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
						</div>

					</div>
					<div class="pull-left mx-1  col-md-5">
						<div class="pull-left mx-1"><%=a%></div>
						<div class="pull-left mx-1">
							<span class="fa fa-star checked"></span>
						</div>

					</div>
				</div>

				<div class="col-md-11">

							<%
								for (review review :
										reviews.getReviews()) {
							%>
							<hr/>
							<div class="row">
								<div class="col-sm-3">
									<img src="data:image/png;base64,<%=Base64.getEncoder().encodeToString(review.getcImg())%>" class="img-rounded" style="height: 50px">
									<div class="review-block-name"><a href="#"><%=review.getcName()%></a></div>
									<div class="review-block-date"><%=review.getTime().substring(0, 10)%></div>
								</div>
								<div class="col-sm-9">
									<div class="stars">
										<%for (int i = 0; i < review.getRate(); i++) {%>
											<span class="fa fa-star checked"></span>
										<%}
										for (int i = 5; i > review.getRate(); i--) {%>
											<span class="fa fa-star"></span>
										<%}%>
									</div>
									<div class="review-block-title"><%=review.getTitle()%></div>
									<div class="review-block-description"><%=review.getComment()%></div>
								</div>
							</div>
							<%}

							%>
					<hr/>

				</div>
				</div>
			</div>

		</div>
	</div>
</div>

<%} catch (Exception ex) {
	System.out.println(ex);
}
%>

<c:import url="./footer.jsp"/>
<script src="<c:url value="/js/vendor/jquery.min.js"/>"></script>
<script src="<c:url value="/js/vendor/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/vendor/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/vendor/lightslider.js"/>"></script>
<script defer src="<c:url value="/css/vendor/fontawesome-pro-5.13.0-web/js/all.min.js"/> "></script>
<script src="<c:url value="/js/vendor/jquery.nice-select.min.js"/>"></script>
<script src="<c:url value="/js/main.js"/>"></script>
<script>
	function updateTotal(){
	    var total =0;
	    for(var i=0; i<document.getElementsByClassName("roomNum").length; i++){
	        total+=document.getElementsByClassName("roomNum")[i].value*document.getElementsByClassName("value")[i].value;
	    }
	    console.log(total);
	    document.getElementById("total").innerText="Total: "+total;
	}
    $(document).ready(function () {
        $("#content-slider").lightSlider({
            loop: true,
            keyPress: true
        });
        $('#image-gallery').lightSlider({
            gallery: true,
            item: 1,
            thumbItem: 9,
            slideMargin: 0,
            speed: 500,
            auto: true,
            loop: true,
            onSliderLoad: function () {
                $('#image-gallery').removeClass('cS-hidden');
            }
        });
    });
</script>

</body>

</html>