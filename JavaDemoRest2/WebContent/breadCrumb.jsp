<div class="breadcrumb">
	<a class="home" title="Home"
		href="http://dev09.usc.ecommera.demandware.net">Home</a> <span
		class="divider">&gt;</span> <span class="resultstext">
			<%
							if( request.getParameter("q") != null){
								out.println("Your Search results for: " +  request.getParameter("q").toString());
							}
						%>
		</span>
</div>