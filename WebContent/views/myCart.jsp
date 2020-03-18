<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.spring.DomainClasses.User"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
<%@include file="header.jsp"%>
    <center>

	
<div class="container">          
 <a class="btn btn-success"  href="getAllProducts.do"
				class="getAllProduct" style="float:right;margin-top:90px;width: 200px;" id="allProducts">See All Products</a><br>

 <input class="form-control" id="myInput" type="text" placeholder="Search.."> 
 <div class="form-control" style="font-size:20px;" id="myCartProducts"><b>My Cart</b></div>
  <table class="table table-bordered table-striped	">
    <thead>
      <tr>
        <th>Medicine Name</th>
        <th>Ordered Date</th>
        <th>Available Quantity</th>
        <th>Quantity</th>
        <th>Save Quantity</th>
        <th>Price</th>
        <th>Status</th>
        <th>Process Order</th>
        <th>Total Amount</th>

      </tr>
    </thead>
     <tbody id="myTable">
     <% int i=1;%>
   <c:choose>
			<c:when test="${ordersMap.size()>0}">			
						<c:forEach var="orderMap" items="${ordersMap}">
			     <tr>
         <td>${orderMap.value.getMedicine().getMedicineName() }</td>
         <td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${orderMap.key.getOrderDate()}" /></td>
         <form action="saveQuantity.do" >
         <td id="aquantity<%=i%>">${orderMap.value.getMedicine().getQuantity()}</td>
         <td><input type="number" value="${orderMap.value.getQuantity() }" name="quantity" id="quantity" onchange="calculateBill('<%=i %>',${ordersMap.size() })" id="quantity<%=i%>"
          min="1" max="${orderMap.value.getMedicine().getQuantity()}" style="width:60px;"/></td>
          <td id="pricePerProduct<%=i%>">${orderMap.key.getTotalAmount()}</td>
          <input type="hidden" value="${orderMap.value.getId()}" name="orderLineId"/>
          <td><input type="submit" id="save" value="Save"></td></form>
          
        <td>${orderMap.key.getStatus()}</td>
        <c:set var="total" value="${total + orderMap.key.getTotalAmount()}" />
        <td><a href="cancelOrder.do?orderLineId=${orderMap.value.getId()}">Cancel Order</a></td>
									 <td id="price<%=i%>">${orderMap.key.getTotalAmount()}</td>									
      </tr>
      <%++i; %>
      </c:forEach>

      <tr>
      <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
       <td >Total Amount</td><td id="total">${total }</td>	
      </tr>
      
     <center> 
		
			</c:when>
			
				<c:otherwise>
				<b>Your Cart is Empty!</b>
				</c:otherwise>
</c:choose>
    </tbody>
  </table>
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

function calculateBill(i,size) {
	alert(i);
	alert(size);
	var qty = document.getElementById("quantity"+i).value;
	var available_qty = document.getElementById("aquantity"+i).innerText;
	var price = document.getElementById("pricePerProduct"+i).innerText;
	document.getElementById("price"+i).innerText = parseFloat(price*(qty));
	var totalAmount = 0;
	for(var j=1;j<=size;j++) {
			totalAmount = totalAmount + parseFloat(document.getElementById("price"+j).innerText);
			
		}
	document.getElementById("total").innerHTML = totalAmount;
}
</script>

</body>

</html>


