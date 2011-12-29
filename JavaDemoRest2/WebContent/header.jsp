<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link media="screen" rel="stylesheet" type="text/css" href="lib/superfish-1.4.8/css/superfish.css" />
<link rel="stylesheet" type="text/css" href="css/default.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/demandwarestore.css" media="screen" />


<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="lib/superfish-1.4.8/js/superfish.js"></script>
<script type="text/javascript" src="lib/superfish-1.4.8/js/hoverIntent.js"></script>

<script type="text/javascript" src="lib/jquery-jtemplates.js"></script>
</head>
<body  id="ext-gen6" class=" ext-gecko ext-gecko2">

<div id="container" class="pt_account">
	<div id="shortcuts"></div>
	<div id="header">
		<h1 class="logo">
			<a href="index.jsp" title="Demandware Shop API Demo">Demandware SiteGenesis</a>
		</h1>

		<div class="dw-object dw-object-rinclude" style="display: none;"></div>
		<div class="headercustomerinfo">
			<span class="welcomemessage">Welcome:</span>
			<% if(request.getSession().getAttribute("cookies") != null){ %>
				<a class="username" title="My Account" href="">
					<span class="username"><%= request.getSession().getAttribute("currentUserName") %></span>
				</a>
					<span class="divider">|</span>
				<a class="usernot" href="logout">(not <%= request.getSession().getAttribute("currentUserName") %>)?</a>
				
			<% } else { %>
				<a class="userlogin" href="login.jsp" title="Login">Login</a>
				<span class="divider">|</span>
				<span>Register</span>
			<%} %>
			
			<div class="clear"></div>
		</div>
		<div class="generalnav">
			<ul>
				<li>
					<span>Wish List</span>
					<span class="divider">|</span>
				</li>
				<li>
					<span>Gift Registry</span>
					<span class="divider">|</span>
				</li>
				<li>
					<span>Store Locator</span>
					<span class="divider">|</span>
				</li>
				<li>
					<span>Help</span>
				</li>
			</ul>
			<div class="clear"></div>
		</div>

		<div class="sitesearch">
			<!-- include search field here -->
			<form action="productSearchResult.jsp" method="GET">
				<input type="text" name="q" id="q" class="simplesearchinput" />
				<button type="submit" value="Go" name="simplesearch">
					<span>Go</span>
				</button>
			</form>
		</div>
		<jsp:include page="minicart.jsp" />
		<jsp:include page="newmenu.jsp" />

		<div class="dw-object dw-object-rinclude" style="display: none;"></div>
		<div class="headerbanner"></div>
		<div class="headerbar">
			<div class="htmlslotcontainer">
				<div>
					<span style="font-size:1.7em; font-weight: bold;">Save 10%</span>
					<span style="font-size:1.2em;">Dummy Offer</span>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<!-- end of header div-->