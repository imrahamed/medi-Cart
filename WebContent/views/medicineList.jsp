<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<center>

	<%@include file="header.jsp"%>
<div class="container">          
 <input class="form-control" id="myInput" type="text" placeholder="Search..">
 <div class="form-control" style="font-size:20px;" id="medicineList"><b>Medicine Product List</b></div>
 <div class="table-responsive autoMargin">
  <table class="table table-bordered w-auto table-striped table-responsive table-bordered	">
    <thead>
      <tr>
	    <th>S.No</th>
        <th>Medicine Name</th>
        <th>Description</th>
        <th>Actual Price</th>
        <th>Discount Price</th>
        <th>Quantity</th>
        <th>Brand</th>
        <th>Category</th>
        <th>isBlocked</th>
        <th>Block/Unblock Products</th>
      </tr>
    </thead>
     <tbody id="myTable">
    <%int i=1; %>
    <c:choose>
    <c:when test="${medicineList.size()>0 }">
    <c:forEach items="${medicineList}" var="medicineIns">
      <tr>
      	<td><%out.println(i);i++; %></td>
        <td><a href="medicineShow.do?medicineId=${medicineIns.getId()}" >${medicineIns.getMedicineName()}</a></td>
        <td>${medicineIns.getDescription() }</td>
        <td>${medicineIns.getActualPrice() }</td>
        <td>${medicineIns.getDiscountPrice() }</td>
        <td>${medicineIns.getQuantity() }</td>
        <td>${medicineIns.getBrand().getBrandName() }</td>
        <td>${medicineIns.getCategory().getCategoryName() }</td>
        <td>${medicineIns.getIsBlocked() }</td>
        <td>
        <c:choose>
        <c:when test = "${medicineIns.getIsBlocked() ==false}">
        <a href="blockProduct.do?medicineId=${medicineIns.getId() }" id="block">Block</a></td>
        </c:when>
        <c:otherwise>
       <a href="unBlockProduct.do?medicineId=${medicineIns.getId() }" id="unblock">Unblock</a>
        </c:otherwise>
        </c:choose>
        </td>
      
      </tr>
      </c:forEach>
      </c:when>
      <c:otherwise>
      <tr>The table is empty</tr>
      </c:otherwise>
      </c:choose>
    </tbody>
  </table>
</div></div>
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


