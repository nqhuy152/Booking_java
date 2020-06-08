<%@ page import="booking.sessionUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.user-ul li {display: inline-block;}
	/*ul li:hover {background: deepskyblue;}*/
	.user-ul li:hover ul {display: block;}
	.user-ul li ul {
		position: absolute;
		margin-left: -13px;
		width: 135px;
		display: none;
		padding-top: 8px;
	}
	.user-ul li ul li {
		padding: 5px 0;
		background: white;
		display: block;
	}
	.user-ul li ul li a {display:block !important;}
	.user-ul li ul li:hover {background: #a8ebff;}
</style>
<header class="bg-dark">
	<nav class="container navbar navbar-expand-lg navbar-dark justify-content-between">
		<a href="<c:url value="/home"/>" class="navbar-brand"><img src="<c:url value="/img/logo2.png"/>" alt="logo"/></a>
		<form class="form-inline">
			<c:if test="${not empty user}">
				<ul class="btn btn-primary user-ul">
					<li>
						<a href="#" style="color: white">Welcome, ${user.getString("Name")}</a>
						<ul>
							<li><a href="<c:url value="/profile?Email=${user.getString('Email')}"/>">Profile</a></li>
							<li><a href="<c:url value="/home?action=logout"/>">Logout</a></li>
<%--							<li><a href="#">Link 3</a></li>--%>
						</ul>
					</li>
				</ul>
			</c:if>

			<c:if test="${empty user}">
				<a class="btn btn-primary mx-2" role="button" href="<c:url value="/login"/>">Sign In</a>
				<a class="btn btn-primary" role="button" href="<c:url value="/signup"/>">Sign Up</a>
			</c:if>

		</form>
	</nav>
</header>