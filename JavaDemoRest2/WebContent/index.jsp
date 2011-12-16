<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../default.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../demandwarestore.css" media="screen" />

<title>Online Shoppe : Login</title>
</head>
<body>

  <div class="label" style="clear:left;display:inline;font-size: 1.1em;font-weight:bold;text-align:right">
      <div class="label.errormessage" style="font-size:1.0em;font-weight:normal;text-align:left">
      </div>
  </div>
	<form action="login" method="post">
		<table name="LoginTable" rows="4" Cols="2" border="0">
			<tr>
				<td>
					<h3>Please Login:</h3>
				</td>
				<td></td>
			</tr>
			<tr>
				<td>User Name:</td>
				<td><input type="text" name="login" id="login" /></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password" id="password" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Login" /></td>
			</tr>
		</table>
	</form>
</body>
</html>

