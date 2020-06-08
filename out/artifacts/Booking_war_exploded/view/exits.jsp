<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Huy Nguyễn
  Date: 6/2/2020
  Time: 10:48 AM
  To change this template use File | Settings | File Templates.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	try{
	    if(request.getParameter("email").isEmpty()){
	        out.print("Email is empty");
	    }else {
		    Class.forName("org.mariadb.jdbc.Driver");
		    String url = "jdbc:mariadb://localhost:3306/booking_pj";
		    Connection con = DriverManager.getConnection(url, "root", "");
		    PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE email = ?");
		    ps.setString(1, request.getParameter("email"));
		    ResultSet res = ps.executeQuery();
		    if (res.first()) {
			    out.print("Email already exists");
		    } else {
			    out.print("Email is valid");
		    }
	    }
	}catch (Exception e){
		System.out.println(e);
	}
%>