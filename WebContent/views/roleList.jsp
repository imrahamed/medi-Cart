<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.spring.DomainClasses.Role"%>
<%@page import="com.spring.DomainClasses.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png" href="images/drug.png">
<link rel="stylesheet" href="css/main.css" type="text/css">
</head>
<title>Online Medicine Cart</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script type="text/javascript"
	src="js/script.js"></script>
</head>
<body>

<%@include file="header.jsp"%>
<div class="container">          
 <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <div id="error" style="color:green; display:block">${message}</div>
 <div class="form-control" style="font-size:20px;" id="roleList"><b><center>
 Role List</center></b></div>
  <table class="table table-bordered table-striped	">
    <thead>
      <tr>
	    <th>S.No</th>
        <th>Role</th>
      </tr>
    </thead>
     <tbody id="myTable">
    <%int i=1; %>
    <c:forEach items="${roleList}" var="roleIns">
      <tr>
      	<td><%out.println(i);i++; %></td>
        <td><a href="roleShow.do?roleId=${roleIns.getId()}" target="_blank">${roleIns.getName()}</a></td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
</center>

<script>

</script>

</body>

</html>


