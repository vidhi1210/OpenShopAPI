<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- container Layout -->
<jsp:include page="header.jsp" />

<!-- Login specific layout -->
<div id="cookiesdisabled" class="disabledcontainer hide"></div>
<div id="main">
	<div id="leftcolumn">
		<div class="accountnavtext"></div>
		<div class="clear"></div>
	</div>
	<div id="content">
		<div class="breadcrumb"></div>
		<div class="accountlogin">
			<h1>My Account</h1>
			<div class="logincreate">
				<h2>New Customers</h2>
			</div>
			<div class="logincustomers">

				<form action="login" method="post">
					<h2>Returning Customers</h2>
					<div class="returningcustomers">
						<div class="username">
							<label class="label"><span class="requiredindicator">*</span>User
								Name:</label>
							<div class="value">
								<input type="text" name="login" id="login" />
							</div>
							<div class="clear"></div>
						</div>
						<div class="password">
							<label class="label"><span class="requiredindicator">*</span>Password:</label>
							<div class="value">
								<input type="password" name="password" id="password" />
							</div>
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

			</div>
			<!-- end of logincustomers -->
			<div class="logingeneral">
				<h2>Check Order</h2>
			</div>
		</div>
		<!-- end of accountlogin -->
	</div>
	<!-- end of content -->
	<div class="clear"></div>
</div>
<!-- end of main -->


<jsp:include page="footer.jsp" />

</div>
<!-- end of container div -->
<jsp:include page="mainFooter.jsp" />