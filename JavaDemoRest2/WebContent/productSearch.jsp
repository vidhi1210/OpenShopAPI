<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Shoppe : Product Search</title>
</head>
<body>
        <jsp:include page="header.jsp" />
		<jsp:include page="newmenu.jsp" />
<form action="productSearchResult.jsp" method="post">
	<input type="text" name="q" id="q"/>
	<input type="submit" value="Search"/>
</form>
</body>
</html>