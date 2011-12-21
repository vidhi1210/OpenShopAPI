<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/default.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/demandwarestore.css" media="screen" />
<title>Login</title>
<script type="text/javascript">
	function init() {
		getCategory();
	}
</script>
</head>


<body id="ext-gen6" class=" ext-gecko ext-gecko2" onload="init()">
	<!-- error in Login -->
  <div class="label" style="clear:left;display:inline;font-size: 1.1em;font-weight:bold;text-align:right">
      <div class="label.errormessage" style="font-size:1.0em;font-weight:normal;text-align:left">
      </div>
  </div>
  
	<!-- container Layout -->
	<div id="container" class="pt_account">
		<div id="shortcuts"></div>
		
		<jsp:include page="header.jsp" />
		<jsp:include page="newmenu.jsp" />
		
		<!-- Login specific layout -->
		<div id="cookiesdisabled" class="disabledcontainer hide"></div>
		<div id="main">
			<div id="leftcolumn">
				<div class="accountnavtext"> </div>
				<div class="clear"></div>
			</div>
			<div id="content">
				<div class="breadcrumb"></div>
				<div class="accountlogin">
					<h1>My Account</h1>
					<div class="logincreate"><h2>New Customers</h2></div>
					<div class="logincustomers">
					
						<form action="login" method="post">
							<h2>Returning Customers</h2>
							<div class="returningcustomers">
								<div class="username">
									<label class="label"><span class="requiredindicator">*</span>User Name:</label>
									<div class="value"><input type="text" name="login" id="login" /></div>
									<div class="clear"></div>
								</div>
								<div class="password">
									<label class="label"><span class="requiredindicator">*</span>Password:</label>
									<div class="value"> <input type="password" name="password" id="password" /></div>
									<div class="clear"></div>
								</div>
								<div class="clear"></div>
								<div class="formactions">
									<button name="dwfrm_login_login" value="Login" type="submit">
									<span>Login</span>
									</button>
									
								</div>
							</div>
							<div class="clear"></div>
						</form>
						
					</div><!-- end of logincustomers -->
					<div class="logingeneral"><h2>Check Order</h2></div>
				</div><!-- end of accountlogin -->
			</div><!-- end of content -->
			<div class="clear"></div>
		</div><!-- end of main -->
		
		
		<jsp:include page="footer.jsp" />
		
	</div><!-- end of container div -->

</body>
</html>





