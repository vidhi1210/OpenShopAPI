<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Online Shoppe : Product Search Result</title>
<script type="text/javascript">
	
function getXMLHttp() {
    var xmlHttp = new XMLHttpRequest();

    return xmlHttp;
}


function getProductResult() {
	var param = "<%=request.getParameter("q")%>";
		jQuery.ajax({
			type : "POST",
			url : "productSearch" + "?q=" + param,
			dataType : "xml",
			success : function(data) {
				$(data).find("hit").each(function() {
					var $productdata = $(this);
					var name = $productdata.find('name').eq(0).text();
					$("#productname").append(name);
					var price = $productdata.find('price').eq(0).text();
					$("#productprice").append(price);
				});
			}
		});
	}

	function getCategory() {
		jQuery.ajax({
			type : "POST",
			url : "productSearch",
			dataType : "xml",
			success : function(data) {
				jQuery(data).find("product_search_result").each(
						function() {
							jQuery("#category").append(
									jQuery(this).find(
											"label:contains('Category')")
											.parent()
											.find('values value label').append(":"));
						});
			}
		});
	}
	
	function addToCart() {
		jQuery.ajax({
			type : "POST",
			url : "addToCart",
			data: {"product_id":"882763039226","quantity":1.00},
			success : function(data){
				
				alert('Add to Cart Successful');
			}
		});
	}	
	function viewCart() {
		
		jQuery.ajax({
			type : "POST",
			url : "viewCart",
			dataType : "xml",
			success : function(data){
				alert('Checkout');
			}
		});
	}	
	
</script>
</head>
<body>
	<form action="shop/v1/product_search" method="post">
		<div id="category">Categories are:</div>
		<div id="productname">Productname</div>
		<div id="productprice">Product Price</div>
		<div id="productshortdescription">Product Short Description</div>
		<input type="button" onClick="javascript:getProductResult();"
			value="Click to get product search  results" /> 
		<input type="button" onClick="javascript:getCategory();" 
			value="Click to get Categories" />
	</form>
	<input type="button" onClick="javascript:addToCart();" 
			value="Add to Cart" />
			
	<input type="button" onClick="javascript:viewCart();" 
			value="View Cart" />
</body>
</html>