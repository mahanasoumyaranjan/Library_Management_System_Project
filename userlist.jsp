<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,java.sql.*,javax.servlet.*,javax.servlet.http.*,Library.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User List Table</title>
<link rel="stylesheet" href="style4.css">
</head>
<body>
<header>
    <h1>Library Management System</h1>
  </header>
  <nav>
    <ul>
      <li><a href="index.html">Home</a></li>
      <li><a href="book.jsp">Books</a></li>
      <li><a href="stats.jsp">Statistics</a></li>
    </ul>
  </nav>
  <main>
    <h2>Users</h2>
    <table>
    <thead>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Phone</th>
        <th>Email</th>
      </tr>
    </thead>
    <tbody>
      <%
      List<UserInfo> list = UserDB.getAllUsers();
      for(UserInfo u:list){
    	  %>
    	  <tr>
          <td><%=u.getName() %></td>
          <td><%=u.getEmail() %></td>
          <td><%=u.getAddress() %></td>
          <td><%=u.getMobile() %></td>
        </tr>
    	  <%
      }
      %>
    </tbody>
  </table>
  </main>
  <footer>
    <p>&copy; 2023 Library Management System</p>
  </footer>
</body>
</html>