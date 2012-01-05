<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/default.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/css/demandwarestore.css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Not Authorized</title>
</head>
<body>
<!-- container Layout -->
    <div id="container" class="pt_account">
		<div id="shortcuts"></div>
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
</div>
 <div class="label" style="clear:left;display:inline;font-size: 1.1em;font-weight:bold;text-align:right">
      <div class="label.errormessage" style="font-size:1.0em;font-weight:normal;text-align:left">
      </div>
  </div>
<h1>Authentication Error..!</h1> <br>
Please <a href="login.jsp">Login Again</a>
</div><!-- end of content -->
</div><!-- end of main -->
<jsp:include page="footer.jsp" />
		
	</div><!-- end of container div -->
</body>
</html>