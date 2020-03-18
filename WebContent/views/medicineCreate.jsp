 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="java.util.*"%>
<%@page import="com.spring.DomainClasses.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png"
	href="images/drug.png">
<link rel="stylesheet"
	href="css/main.css"
	type="text/css" />
	<script type="text/javascript"
	src="js/script.js"></script>
</head>
<title>Online Medicine Cart</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<body style="background-color: #E5E8E8;">
<%@include file="header.jsp"%>
	<center>


		<c:choose>
			<c:when test="${medicineIns.getMedicineName()==null}">
				<form class="modal-content animate" style="margin-top: 90px;"
					action="createMedicine.do"
					method="post">


					<div class="container">
						<img class="logo-icon"
							src="images/drug.png" />
						<h2>Sell your Product</h2>
						<br> <input type="text" placeholder="Enter Medicine Name"
							class="input-fields" name="medicineName" id="medicineName" required><br>
						<input type="text" placeholder="Enter Description"
							name="description" id="description" class="input-fields" required><br>
							<input type="text" placeholder="Enter Image URL"
							name="imageURL" class="input-fields" id="imageURL"><br>
						<input type="text" placeholder="Enter Actual Price"
							name="actualPrice" id="actualPrice" class="input-fields" required><br>
						<input type="text" placeholder="Enter Discount Price"
							name="discountPrice" class="input-fields" id="discountPrice"><br>
						<input type="number" placeholder="Enter Quantity" name="quantity"
							class="input-fields" id="quantity"><br> <select
							id="brandId" name="brandId" class="input-fields">
							<option value="NONE">--- Select Brand ---</option>
							<c:forEach items="${brandList}" var="brandIns">
								<option value="${brandIns.getId()}">${brandIns.getBrandName()}</option>
							</c:forEach>
						</select> <select id="categoryId" name="categoryId" class="input-fields">
							<option value="NONE">--- Select Category ---</option>
							<c:forEach items="${categoryList}" var="categoryIns">
								<option value="${categoryIns.getId()}">${categoryIns.getCategoryName()}</option>
							</c:forEach>
						</select>

						<button type="submit"  id="register" class="loginButton">Register</button>
					</div>
				</form>
			</c:when>
			<c:otherwise>
				<form class="modal-content animate" style="margin-bottom:-100px;"
					action="medicineUpdate.do"
					method="post">
					<div class="container">
						<img class="logo-icon"
							src="images/drug.png" />
						<h2>Edit your Product</h2>
						
						<br> <input type="text" value="${medicineIns.getMedicineName()}"
							class="input-fields" name="medicineName" required><br>
						<input type="text" value="${medicineIns.getDescription() }"
							name="description" class="input-fields" required><br>
						<input type="text" value="${medicineIns.getActualPrice() }"
							name="actualPrice" class="input-fields" required><br>
						<input type="text" value="${medicineIns.getDiscountPrice() }"
							name="discountPrice" class="input-fields" required><br>
						<input type="number" value="${medicineIns.getQuantity() }" name="quantity"
							class="input-fields" required><br> <select
							id="brandId" name="brandId" class="input-fields">
							<option value="${medicineIns.getBrand().getId()}">${medicineIns.getBrand().getBrandName() }</option>
							<c:forEach items="${brandList}" var="brandIns">
								<option value="${brandIns.getId()}">${brandIns.getBrandName()}</option>
							</c:forEach>
						</select> <select id="categoryId" name="categoryId" class="input-fields">
							<option value="${medicineIns.getCategory().getId() }">${medicineIns.getCategory().getCategoryName() }</option>
							<c:forEach items="${categoryList}" var="categoryIns">
								<option value="${categoryIns.getId()}">${categoryIns.getCategoryName()}</option>
							</c:forEach>
						</select>
						<input type="hidden" value="${ medicineIns.getId()}" name="medicineId"/>

						<button type="submit" class="loginButton">Update Product</button>
					</div>
				</form>
			</c:otherwise>
		</c:choose>


	</center>
</body>

</html>
