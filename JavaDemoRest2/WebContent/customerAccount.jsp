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
	<jsp:include page="newmenu.jsp" />

	
	
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
			
<a title="Home" href="home">Home</a>

</div>
			
<div class="accountoverview">
<h2>My Account</h2>
<div class="accountwelcome">
<div class="welcomemessage"> Hello <%out.println(request.getAttribute("customerAccount").toString());%>, Welcome Back </div>
<div class="not_user">
Are you not
<span class="username">
<%out.println(request.getAttribute("customerAccount").toString());%></span>
(
<a href="logout" title="Logout">Logout</a>
)
</div>
</div>
</div>

</div><!-- end of content -->
	
		</div><!-- end of main -->
		
		<jsp:include page="footer.jsp" />
		
	</div><!-- end of container -->
	
	

</body>
</html>