<%@ page import="booking.model.user" %>
<%@ page import="booking.sessionUtil" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Base64" %>
<%@ page import="static booking.model.user.userMapper" %>
<%@ page import="booking.model.review" %>
<%@ page import="booking.DAO.reviews" %>
<%@ page import="booking.DAO.reservations" %>
<%@ page import="booking.model.reservation" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no"/>
	<link rel="icon" href="<c:url value="/img/bookingIcon.svg"/>"/>
	<link rel="stylesheet" href="<c:url value='/css/style.css'/>"/>
	<link rel="stylesheet" href="<c:url value='/css/vendor/bootstrap.min.css'/>"/>
	<style>
		label img:hover{
			filter: opacity(0.5);
		}
	</style>
	<title>Profile</title>
</head>

<body>
<c:import url="header.jsp"/>
<%
	ResultSet a = (ResultSet) sessionUtil.getInstance().getValue(request, "user");
	try {
		String img = Base64.getEncoder().encodeToString(a.getBytes("avatar"));
		request.setAttribute("img", img);
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>
<div class="container emp-profile">
	<form method="post">
		<div class="row">
			<div class="col-md-4">
				<div class="profile-img">
					<label for="file"><img src="data:image/png;base64,${img}" alt="avatar" id="avatar"/></label>
<%--					<div class="file btn btn-lg btn-primary">--%>
<%--						Change Photo--%>
						<input type="file" name="file" id="file" onchange="document.getElementById('avatar').src = window.URL.createObjectURL(this.files[0])" hidden />

<%--					</div>--%>
				</div>
			</div>
			<div class="col-md-6">
				<div class="profile-head">
					<h5>
						${user.getString("name")}
					</h5>
					<h6>
						${user.getString("role")}
					</h6>
<%--					<p class="proile-rating">RANKINGS : <span>8/10</span></p>--%>
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item">
							<a class="nav-link active" id="info-tab" data-toggle="tab" href="#info" role="tab" aria-controls="info" aria-selected="true">Info</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id="history-tab" data-toggle="tab" href="#history" role="tab" aria-controls="history" aria-selected="false">History</a>
						</li>
					</ul>
				</div>

						<div class="tab-content profile-tab" id="myTabContent">
							<div class="tab-pane fade show active" id="info" role="tabpanel" aria-labelledby="info-tab">
								<div class="row">
									<div class="col-md-6">
										<label>Name</label>
									</div>
									<div class="col-md-6">
										<p>${user.getString("Name")}</p>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<label>Email</label>
									</div>
									<div class="col-md-6">
										<p>${user.getString("email")}</p>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<label>Phone:</label>
									</div>
									<div class="col-md-6" id="uphone">
										<p>${user.getString("Phone")}</p>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<label>DoB:</label>
									</div>
									<div class="col-md-6" id="DoB">
										<p>${user.getString("DoB")}</p>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<label>Bank:</label>
									</div>
									<div class="col-md-6" id="bank">
										<p>${user.getString("bankNo")}</p>
									</div>
								</div>
							</div>

							<div class="tab-pane fade" id="history" role="tabpanel" aria-labelledby="history-tab">
								<div class="accordion" id="accordionExample">
								<%
									int i=0;
									for (reservation reservation:
											reservations.getReservations()){
								%>

									<div class="card">
										<div class="card-header" id="heading<%=i%>">
											<h5 class="mb-0">
												<button class="btn btn-link" type="button" data-toggle="collapse"
												        data-target="#collapse<%=i%>"
												        aria-expanded="true" aria-controls="collapse<%=i%>">
													<%=reservation.getHName()%>
												</button>
												<h4 class="pull-right"><%=reservation.getBookedDate()%></h4>
											</h5>
										</div>
										<div id="collapse<%=i%>" class="collapse"
										     aria-labelledby="heading<%=i++%>" data-parent="#accordionExample">
											<div class="card-body row">
												<p class="col-lg-12">ID:<br><%=reservation.getId()%></p>
												<p class="col-lg-6">From:<br><%=reservation.getDateFrom()%></p>
												<p class="col-lg-6">To:<br><%=reservation.getDateTo()%></p>
												<p class="col-lg-6">Room Type:<br><%=reservation.getRoomType()%></p>
												<p class="col-lg-6">Quantity:<br><%=reservation.getQuantity()%></p>
												<p class="col-lg-6">Price:<br><%=reservation.getQuantity()*reservation.getPrice()%></p>
											</div>
										</div>
									</div>

								<%}

								%>
								</div>
							</div>
						</div>
			</div>
			<div class="col-md-2">
				<input class="profile-edit-btn" name="btnAddMore" value="Edit Profile"/>
			</div>
		</div>

	</form>
</div>
<c:import url="./footer.jsp"/>
<footer>
	<script src="<c:url value="/js/vendor/jquery.min.js"/>"></script>
<%--	<script src="<c:url value="/js/vendor/jquery-ui.min.js"/>"></script>--%>
	<script src="<c:url value="/js/vendor/bootstrap.min.js"/>"></script>

</footer>

</body>

</html>