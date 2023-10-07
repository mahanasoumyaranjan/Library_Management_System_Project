<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,java.sql.*,javax.servlet.*,javax.servlet.http.*,Library.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Issued Book List</title>
<link rel="stylesheet" href="style4.css">
</head>
<body>
<main>
    <h2>Issued Books</h2>
    <table>
    <thead>
      <tr>
        <th>User Name</th>
        <th>Book Name</th>
        <th>Issue Date</th>
        <th>Return By</th>
      </tr>
    </thead>
    <tbody>
      <%
      List<Issue1Info> list = Issue1Dao.getAllIssueBooks();
      for(Issue1Info u:list){
    	  %>
    	  <tr>
          <td><%=u.getName() %></td>
          <td><%=u.getBname() %></td>
          <td><%=u.getToday() %></td>
          <td>Within 6 months from <%=u.getToday() %></td>
        </tr>
    	  <%
      }
      %>
    </tbody>
  </table>
  </main>
</body>
</html>