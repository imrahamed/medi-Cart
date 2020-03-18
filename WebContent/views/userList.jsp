<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.spring.DomainClasses.User"%>
<%@page import="com.spring.DomainClasses.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css?family=Charm|Felipa|Lobster" rel="stylesheet">
<link rel="icon" type="image/png"
	href="images/drug.png">
<link rel="stylesheet"
	href="css/main.css"
	type="text/css" />
<script type="text/javascript"
	src="js/script.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>   -->
</head>
<body>
<%@include file="header.jsp"%>
	<center>

<div class="container">          
 <input class="form-control" id="searchList" type="text" placeholder="Search..">
 <div class="form-control" style="font-size:20px;margin-top:100px;" id="userList"><b>User List</b></div>
  <table class="table table-bordered table-striped	">
    <thead>
      <tr>
	    <th>S.No</th>
        <th>UserName</th>
        <th>Email</th>
        <th>Mobile Number</th>
        <th>Address</th>
        <th>Role</th>
      </tr>
    </thead>
     <tbody id="myTable">
    <%int i=1; %>
    <c:forEach items="${userList}" var="userIns">
      <tr>
      	<td><%out.println(i);i++; %></td>
        <td><a id="userName<%=i%>" href="userShow.do?userId=${userIns.getId()}" target="_blank">${userIns.getUserName()}</a></td>
        <td>${userIns.getEmail() }</td>
        <td>${userIns.getMobile() }</td>
        <td>${userIns.getAddress() }</td>
    	<td>${userIns.getRole().getName()}</td> 
      </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
</center>

<script>
/*$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});*/
</script>

</body>

</html>


