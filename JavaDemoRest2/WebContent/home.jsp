<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="css/default.css" media="screen" />

<link rel="stylesheet" type="text/css" href="css/demandwarestore.css" media="screen" />

<title>Insert title here</title>
</head>
<body>

<div id="container" class="pt_account">
		
<div id="shortcuts">
</div>
		
<jsp:include page="header.jsp" />
<jsp:include page="menu.jsp" />
		
<div id="cookiesdisabled" class="disabledcontainer hide">
</div>
	
	<div id="main">
		
	<div id="leftcolumn">
	
			<div class="accountnavtext">
 </div>
		
		<div class="clear">
</div>
			
</div>
			
<div id="content">
	
			<div class="breadcrumb">
</div>
			




	<a href="customerAccount"> My Account</a>
	<a href="logout">logout</a>
	
	
<form action="productSearchResult.jsp" method="post">

	<input type="text" name="q" id="q"/>
	<input type="submit" value="Search"/>
</form>
	
	</div><!-- end of content -->
	
		</div><!-- end of main -->
	</div><!-- end of container -->
	
	
	

</body>
</html>