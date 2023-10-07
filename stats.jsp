<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,java.sql.*,javax.servlet.*,javax.servlet.http.*,Library.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Statistics | Library Management System</title>
  <link rel="stylesheet" href="style5.css">
</head>
<body>
  <header>
    <h1>Library Management System</h1>
  </header>
  <nav>
    <ul>
      <li><a href="index.html">Home</a></li>
    </ul>
  </nav>
  <main>
    <h2>Statistics</h2>
    <div class="statistics">
      <div class="statistic">
        <h3>Total Avl. Books</h3>
        <%BookDao b = new BookDao(); %>
        <p><%=b.TotalBooks() %></p>
      </div>
      <div class="statistic">
        <h3>Users</h3>
        <%UserDB u = new UserDB(); %>
        <p><%=u.TotalUsers() %></p>
      </div>
      
    </div>
  </main>
  <footer>
    <p>&copy; 2023 Library Management System</p>
  </footer>
</body>
</html>