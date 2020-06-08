<%@ page import="booking.DAO.Connect" %>
<%@ page import="java.sql.*" %>
<%@ page import="booking.sessionUtil" %><%--
  Created by IntelliJ IDEA.
  User: Huy Nguyễn
  Date: 6/2/2020
  Time: 10:48 AM
  To change this template use File | Settings | File Templates.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	try{
	        ResultSet a= (ResultSet) sessionUtil.getInstance().getValue(request, "user");
			Part image = request.getPart("avatar");
			PreparedStatement ps = Connect.con.prepareStatement("update user set avatar = ? WHERE email = ?");
			ps.setBlob(1, image.getInputStream());
			ps.setString(2, a.getString("email"));
			System.out.println(request.getParameter("email"));
			ps.executeUpdate();
			ps.close();
	}catch (SQLException e){
		System.out.println(e);
	}
%>