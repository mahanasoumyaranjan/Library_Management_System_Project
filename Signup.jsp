<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Library.*,javax.servlet.*,javax.servlet.http.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Signup</title>
</head>
<body>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("password");
String address = request.getParameter("address");
long mobile = Long.parseLong(request.getParameter("mobile"));
String dob = request.getParameter("dob");
if(UserDB.Check_Email(email)){
	%>
	<h2>User already registered, try with another account</h2>
	<jsp:include page="Signup.html"></jsp:include>
	<%
}else{
	UserInfo u = new UserInfo();
	u.setName(name);
	u.setEmail(email);
	u.setPassword(password);
	u.setAddress(address);
	u.setMobile(mobile);
	u.setDob(dob);
	int i = UserDB.save(u);
	if(i>0){
		response.sendRedirect("userlogin.html");
	}else{
		%>
		<h2>Unable to register user </h2>
		<jsp:include page="Signup.html"></jsp:include>
		<%
	}
}
%>
</body>
</html>