<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% System.out.println("newmenu1"); %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Get the menu</title>

<link media="screen" rel="stylesheet" type="text/css" href="js/superfish-1.4.8/css/superfish.css" />
<link rel="stylesheet" type="text/css" href="css/default.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/demandwarestore.css" media="screen" />


<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="js/superfish-1.4.8/js/superfish.js"></script>
<script type="text/javascript" src="js/superfish-1.4.8/js/hoverIntent.js"></script>

<script type="text/javascript" src="js/jquery-jtemplates.js"></script>


<script type="text/javascript">


$(document).ready(function(){
	$('#navigation').setTemplate($("#menuTemplate").html());
	$('.categorymenu ul').addClass('sf-menu');			
	//$('ul.sf-menu').superfish({autoArrows	: false, dropShadows : false}).find('ul').bgIframe();
	$.ajax({
		type : "POST",
		url : "menu",
		dataType : "json",
		success : function(data) {
			$('#navigation').processTemplate(data);
		}
	 });
	});
	
</script>
</head>
<body>
	<div id="navigation" class="categorymenu">
				
	<script type="text/html" id="menuTemplate">
		<ul class="sf-menu sf-js-enabled">
		{#foreach $T.categories as cat}	
			<li class=""><a href="/user/messages">{$T.cat.name}</a>
				<ul class="sf-menu sf-js-enabled">
					{#foreach $T.cat.categories as subcat}	
						<li><a href="/user/messages">{$T.subcat.name}</a></li>
					{#/for}
				</ul>
			</li>
		{#/for}
		</ul>
	</script>
			
	</div>		
</body>
</html>