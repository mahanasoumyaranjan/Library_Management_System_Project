<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,java.sql.*,javax.servlet.*,javax.servlet.http.*,Library.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <title>e-Library - Books</title>
  <link rel="stylesheet" href="stylebook.css">
</head>
<body>
   </body>
  <header>
    <h1>e-Library</h1>
    <nav>
      <ul>
        <li><a href="logou1.jsp">Logout</a></li>
        <li><a href="addbook.html">Add Book</a></li>
        <li><a href="delete.jsp">Delete Book</a></li>
        <li><a href="userlist.jsp">User List</a>
        <li><a href="viewissuedbook.jsp">View Issued Books</a></li>
        <li><a href="book.jsp">Books</a></li>
      </ul>
    </nav>
  </header>
  <main>
    <h2>Books</h2>
    <div class="book-list">
    <%
    List<BookInfo> list = BookDao.getAllBooks();
    int count = 1;
    for(BookInfo b:list){
    	%>
    	<div class="book">
        <img src="th.jpg" alt="Book <%=count %>">
        <h3><%=b.getName() %></h3>
        <p>Author: <%=b.getAuthor() %></p>
        <p>Category: <%=b.getCategory() %></p>
        <button><a href="https://www.goodreads.com/book/show/18144590-the-alchemist" style="text-decoration:none;color:white;">Read Now</a></button>
      </div>
      <%
      count++;
	}
    %>
  </main>
  <footer>
    <p>&copy; 2023 e-Library</p>
  </footer>
</body>
</html>