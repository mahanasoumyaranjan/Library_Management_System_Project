<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Library.*,javax.servlet.*,javax.servlet.http.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Validate</title>
</head>
<body>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");
session.setAttribute("email", email);
if(AdminDB.validate(email, password)){
	response.sendRedirect("book.jsp");
}else{
	%>
	<h3 style="color:black;">Invalid Username or Password!</h3>
	<jsp:include page="AdminLogin.html"></jsp:include>
	<%
}
%>
</body>
</html>