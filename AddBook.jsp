<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,java.sql.*,javax.servlet.*,javax.servlet.http.*,Library.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Book JSP</title>
</head>
<body>
<%
String name = request.getParameter("bookname");
String author = request.getParameter("author");
String category = request.getParameter("category");
BookInfo b = new BookInfo();
b.setName(name);
b.setAuthor(author);
b.setCategory(category);
int i = BookDao.SaveBook(b);
if(i>0){
	%>
	<h2>Book added successfully !!</h2>
	<jsp:include page="book.jsp"></jsp:include>
	<%
}else{
	%>
	<h2>Something went wrong, try again !!!</h2>
	<jsp:include page="book.jsp"></jsp:include>
	<%
}
%>
</body>
</html>