<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% System.out.println("newmenu1"); %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Get the menu</title>
<link rel="stylesheet" type="text/css" href="css/default.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/demandwarestore.css" media="screen" />

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type : "POST",
		url : "menu",
		dataType : "json",
		success : function(data) {
			$.each(data.categories, function(i, cat){
				$("#navigation ul").append('<li><a href="/user/messages">' + cat.name + '</a></li>');
			});
		}
	 });
	});
	
</script>
</head>
<body onload="loadingMenu()">
	<form action="shop/v1/categories" method="post">
	<div id="navigation" class="categorymenu">
		<ul class="sf-menu sf-js-enabled">
			
		</ul>	
	</div>		
	</form>
</body>
</html>