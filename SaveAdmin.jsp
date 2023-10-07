<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Library.*,javax.servlet.*,javax.servlet.http.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Signup Page</title>
</head>
<body>
<%
String fname = request.getParameter("first-name");
String lname = request.getParameter("last-name");
String email = request.getParameter("email");
String password = request.getParameter("password");
AdminInfo u = new AdminInfo();
u.setFname(fname);
u.setLname(lname);
u.setEmail(email);
u.setPassword(password);
if(AdminDB.Check_Email(email)){
	%>
	<h2>Email is already exist</h2>
	<jsp:include page="library.html"></jsp:include>
	<%
}else{
	int i = AdminDB.save(u);
	if(i>0){
		response.sendRedirect("AdminLogin.html");
	}else{
		%>
		<h2>Unable to signup</h2>
		<jsp:include page="library.html"></jsp:include>
		<%
	}
}
%>
</body>
</html>