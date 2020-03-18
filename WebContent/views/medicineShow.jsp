<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	    <%@page import="com.spring.DomainClasses.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png"
	href="images/drug.png">
<link rel="stylesheet"
	href="css/main.css"
	type="text/css" />
	<script type="text/javascript" src="js/script.js"></script>
</head>

<title>Online Medical Cart</title>


<body style="background-color: #E5E8E8;">

	<center>
	<%@include file="header.jsp"%>
				<form action="medicineEdit.do" method="post">
			
			<div class="modal-content" style="margin-top:150px;height:400%;">
			
			<h2>Medicine Details</h2>
			 <div id="error" style="color:green; display:block">${message}</div>
			<table border="1px" style="border-collapse: separate;
  border-spacing: 15px 30px;margin:auto;">
			<tr>
			<td class="attribute-values"><b>Medicine Name</b></td><td class="attribute-values">${medicineIns.getMedicineName()}</td>
			</tr>
			<tr>
			<td class="attribute-values"><b>Description</b></td><td class="attribute-values">${medicineIns.getDescription() }</td>
			</tr>
			<tr>
			<td class="attribute-values"><b>Actual Price</b></td><td class="attribute-values">${medicineIns.getActualPrice() }</td>
			</tr>
			<tr>
			<td class="attribute-values"><b>Discount Price</b></td><td class="attribute-values">${medicineIns.getDiscountPrice() }</td>
			</tr>
			<tr>
			<td class="attribute-values"><b>Quantity</b></td><td class="attribute-values">${medicineIns.getQuantity() }</td>
			</tr>
			<tr>
			<td class="attribute-values"><b>Brand Name</b></td><td class="attribute-values">${medicineIns.getBrand().getBrandName() }</td>
			</tr>
			<tr>
			<td class="attribute-values"><b>Category Name</b></td><td class="attribute-values">${medicineIns.getCategory().getCategoryName() }</td>
			</tr>

			
			</table>
			<input type="hidden" value="${medicineIns.getId()}" name="medicineId"/>
			<button class="btn btn-success" type="submit" style="width:100px;">Edit</button>
			<button class="btn btn-success" type="submit" formaction="medicineDelete.do" style="width:100px;background-color:red;">Delete</button>
			
			</div>
			</form>


	</center>
</body>


</html>
