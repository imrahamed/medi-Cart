<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.spring.DomainClasses.User"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png"
	href="images/drug.png">
<link rel="stylesheet"
	href="css/main.css"
	type="text/css">
</head>
<title>Online Medicine Cart</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script type="text/javascript"
	src="js/script.js"></script>
</head>
<body>
	<%@include file="header.jsp"%>
	<center>
		<div class="container">
			<input class="form-control" id="myInput" type="text"
				placeholder="Search..">
			<div class="form-control" style="font-size: 20px;" id="myOrderProducts">
				<b>My Orders</b>
			</div>
			<table class="table table-bordered table-striped	">
				<thead>
					<tr>
						<th>Medicine Name</th>
						<th>Ordered Date</th>
						<th>Quantity</th>
						<th>Ordered By</th>
						<th>Address</th>
						<th>Mobile</th>
						<th>Total Amount</th>

					</tr>
				</thead>
				<tbody id="myTable">
					<c:choose>
						<c:when test="${orderLineList.size()>0}">
							<c:forEach var="orderLineIns" items="${orderLineList}">
								<tr>
									<td>${orderLineIns.getMedicine().getMedicineName()}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${orderLineIns.getOrders().getOrderDate()}" /></td>
									<td>${orderLineIns.getQuantity()}</td>
									<td>${orderLineIns.getOrders().getUser().getUserName()}</td>
									<td>${orderLineIns.getOrders().getUser().getAddress()}</td>
									<td>${orderLineIns.getOrders().getUser().getMobile()}</td>
									<td>${orderLineIns.getOrders().getTotalAmount()}</td>
								</tr>
							</c:forEach>
							<center>
						</c:when>

						<c:otherwise>
							<b>Your Cart is Empty!</b>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<a class="btn btn-success"
				href="getAllProducts.do"
				class="getAllProduct">Get All Products</a><br>
		</div>
	</center>

	<script>
		
	
	/*	$(document)
				.ready(
						function() {
							$("#myInput")
									.on(
											"keyup",
											function() {
												var value = $(this).val()
														.toLowerCase();
												$("#myTable tr")
														.filter(
																function() {
																	$(this)
																			.toggle(
																					$(
																							this)
																							.text()
																							.toLowerCase()
																							.indexOf(
																									value) > -1)
																});
											});
						});*/
	</script>

</body>

</html>


