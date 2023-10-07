<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Library.*,javax.servlet.*,javax.servlet.http.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Check</title>
</head>
<body>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");
session.setAttribute("email", email);
if(UserDB.validate(email, password)){
	response.sendRedirect("book1.jsp");
}else{
	%>
	<h2>Invalid Credentials</h2>
	<jsp:include page="userlogin.html"></jsp:include>
	<%
}
%>
</body>
</html>