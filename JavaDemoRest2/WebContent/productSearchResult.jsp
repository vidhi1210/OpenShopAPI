<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="header.jsp" />
<title>Online Shop : Product Search Result</title>

<script type="text/javascript">
$(document).ready(function(){ 
	$('#productListing').setTemplate($("#productListingTemplate").html() ) ;
	$('#searchrefinements').setTemplate($("#searchRefinmentTemplate").html());
	
	<%
		String url = "productSearch?" + request.getQueryString();
	%>
	var sUrl= '<%= url %>';
		$.ajax({
			type : "GET",
			url : sUrl,
			dataType : "json",
			success : function(data) {
				$('#searchrefinements').processTemplate(data);
				$('#productListing').processTemplate(data);
			}
		});
});

</script>

<div id="container" class="pt_productsearchresult">
<div id="main">
		<jsp:include page="searchRefinements.jsp" />
		<div id="content">
				<jsp:include page="breadCrumb.jsp" />
				<div class="producthits">
					<div id="search" class="search">
						<div class="productresultarea">
							<div class="productisting" id="productListing">
							<script type="text/html" id="productListingTemplate">
						        {#foreach $T.hits as hit}	
								<div class="product producttile">
									<div class="image">
										<div class="thumbnail">
											<p class="productimage">
												<a title="{$T.hit.image.title}" href="productView.jsp?product_id={$T.hit.id}">
													<img class="" width="113" height="113" title="{$T.hit.image.title}" alt="{$T.hit.image.alt}" src="{$T.hit.image.link}"/>
												</a>
											</p>
										</div>
									</div>
									<div class="name">
										<a title="{$T.hit.name}" href=""> {$T.hit.name} </a>
									</div>	
									<div class="pricing">
										<div class="price">
											<div class="discountprice">
												<div class="standardprice"> {$T.hit.price} </div>
												<div class="salesprice"> {$T.hit.price} </div>
											</div>
										</div>
									</div>
								</div>
								{#/for}
								</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>
<!-- end of main -->
<jsp:include page="footer.jsp" />

<!-- end of container div -->
<jsp:include page="mainFooter.jsp" />