<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.spring.DomainClasses.Category"%>
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
  <script type="text/javascript" src="js/script.js"></script>
</head>
<body>
    <center>

<%@include file="header.jsp"%>
<div class="container">          
 <input class="form-control" id="myInput" type="text" placeholder="Search..">
 <div class="form-control" style="font-size:20px;" id="categoryList"><b>Category List</b></div>
  <table class="table table-bordered table-striped	">
    <thead>
      <tr>
	    <th>S.No</th>
        <th>Category Name</th>
        <th>Description</th>
      </tr>
    </thead>
     <tbody id="myTable">
    <%int i=1; %>
    <c:forEach items="${categoryList}" var="categoryIns">
      <tr>
      	<td><%out.println(i);i++; %></td>
        <td><a href="categoryShow.do?categoryId=${categoryIns.getId()}" target="_blank">${categoryIns.getCategoryName()}</a></td>
        <td>${categoryIns.getDescription()}</td>
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


