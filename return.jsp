<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,java.sql.*,javax.servlet.*,javax.servlet.http.*,Library.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String email = request.getParameter("email");
String bookname = request.getParameter("bookname");
int i = Issue1Dao.Return(email, bookname);
if(i>0){
	%>
	<h2>Book returned successfully !!!</h2>
	<jsp:include page="book1.jsp"></jsp:include>
	<%
}else{
	%>
	<h2>Unable to return !!!</h2>
	<jsp:include page="book1.jsp"></jsp:include>
	<%
}
%>
</body>
</html>