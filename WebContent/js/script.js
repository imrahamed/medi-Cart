function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
// $(document).ready(function(){
//   $("#myInput").on("keyup", function() {
//     var value = $(this).val().toLowerCase();
//     $("#myTable tr").filter(function() {
//       $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
//     });
//   });
// });


var x=1
function appendRow()
{
   var d = document.getElementById('division');
   d.innerHTML = d.innerHTML+"<input type='text' placeholder='Enter Brand Name' name='brandName' class='input-fields' required id='tst"+ x++ +"'>";
}

function validate() {
    alert("dknfh");
    var flag=true;
    var mobile = document.getElementById("mobile").value;
    var username = document.getElementById("username").value;
    alert("username"+username);
    var email = document.getElementById("email").value;
	var password = document.getElementById("password").value;
    var cpassword = document.getElementById("confirm_password").value;
    if(username.length==0){
        alert("dcbhjxhc");
        flag = false;
		document.getElementById("username_error").style.display = 'block';
		} 
	else{
			document.getElementById("username_error").style.display = 'none';
            }
             if(email.length==0){
        flag = false;
		document.getElementById("email_error").style.display = 'block';
		} 
	else{
			document.getElementById("email_error").style.display = 'none';
			}
	if(password!=cpassword){
		flag = false;
		document.getElementById("password_error").style.display = 'block';
		} 
	else{
			document.getElementById("password_error").style.display = 'none';
			}
	if(isNaN(mobile))
		{
		flag=false;
		document.getElementById("mobile_error").style.display= 'block';
		}
	else
		document.getElementById("mobile_error").style.display= 'none';
		if(mobile.length!=10)
			{
			document.getElementById("mobile_error").style.display= 'block';
			flag=false;
			}
			
		else
			document.getElementById("mobile_error").style.display= 'none';
			alert(flag);
	
	return flag;
		
	}

	var productCart = [];
	var i = 0;
	function openPopup(value) {
		productCart[i] = value;
		//console.log(productCart);
		i++;
		alert("Your product has been added successfully");
		document.getElementById("count").innerHTML = productCart.length;

	}
	function myCartProducts() {		
		document.getElementById("myCart").innerHTML = "";
		if(productCart.length<=0) {
			document.getElementById("myCart").innerHTML = "<div class='cartEmpty'><center><div style='margin-top:30px;'><h4>Your Cart is Empty!</h4></div></center></div>";
			}
		
		for(var j=0;j<productCart.length;j++) {
			 var x = document.createElement("HR");
			var para = document.createElement("OL");
			var node = document.createTextNode((j+1)+"."+productCart[j]+"  "+"1");
			para.appendChild(node);
			var element = document.getElementById("myCart");
			element.appendChild(para);
			x.style.cssText = "width:330px;margin-top:25px;";
			 element.appendChild(x);
			}
		}

	function addToMyCart() {
	/*	$.ajax({
	        type: "POST",
	        data : {
	  			myArray:  JSON.stringify(productCart),
	        },
	        url: "/OnlineMedicineCart/addToCart.do",
	        success: function(data) {
	            $('html').html(data);
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	            alert(error)
	        }
	    });*/
		}
	function clearMyCart() {
		alert("cleared");
		productCart = [];
		document.getElementById("count").innerHTML = productCart.length;
		}

