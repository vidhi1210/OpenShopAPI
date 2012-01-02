<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="header.jsp" />
<title>Online Shop : Product Search Result</title>

<script type="text/javascript">
alert('welcome');
$(document).ready(function(){ 
	$('#productListing').setTemplate($("#productListingTemplate").html() ) ;
	$('#searchrefinements').setTemplate($("#searchRefinmentTemplate").html());
	
	var param = "<%=request.getParameter("q")%>";
		$.ajax({
			type : "GET",
			url : "ProductDetail" + "?q=" + param,
			dataType : "json",
			success : function(data) {
				$('#searchrefinements').processTemplate(data);
				$('#productListing').processTemplate(data);
				
			}
		});
});

	function getCategory() {
		jQuery.ajax({
			type : "POST",
			url : "productSearch",
			dataType : "xml",
			success : function(data) {
				jQuery(data).find("product_search_result").each(
						function() {
							jQuery("#category").append(
									jQuery(this).find(
											"label:contains('Category')")
											.parent()
											.find('values value label').append(":"));
						});
			}
		});
	}
	
	function addToCart() {
		jQuery.ajax({
			type : "POST",
			url : "addToCart",
			data: {"product_id":"882763039226","quantity":1.00},
			success : function(data){
				
				alert('Add to Cart Successful');
			}
		});
	}	
	function viewCart() {
		
		jQuery.ajax({
			type : "POST",
			url : "viewCart",
			dataType : "xml",
			success : function(data){
				alert('Checkout');
			}
		});
	}	
	
</script>

<div id="container" class="pt_productsearchresult">
<div id="main">
		<div id="leftcolumn">
			<div id="subnav" class="searchrefine">
				<h1 class="searchheader">Search Results</h1>
				<div class="searchrefinemessage">Refine Your Results By:</div>
				<div id="searchrefinements" class="searchrefinements">
					<script type="text/html" id="searchRefinmentTemplate">
					{#foreach $T.refinements as refinement}
					{#if $T.refinement.label == 'Category'}					
					<div id="refinement-category" class="searchcategories refinement">
						<div class="searchcategory">
							<span>{$T.refinement.label}</span>
						</div>
						<ul id="category-level-1" class="refinementcategory">
						{#foreach $T.refinement.values as val}
								<li class="expandable"><a class="refineLink " title="{$T.val.value}">{$T.val.value}</a></li>
						{#/for}
						</ul>
					{#/if}
					</div>
										
					{#if $T.refinement.label == 'Price'}
					<div id="refinement-price" class="navgroup refinement">
						<h2>{$T.refinement.label}</h2>
						<div class="refinedclear"></div>
						<div class="refineattributes">
							<div class="pricerefinement">
								<ul>
									{#foreach $T.refinement.values as val}
									<li>
										<a class="refineLink" href="">{$T.val.label}</a>
									</li>
									{#/for}
							</div>
						</div>
					</div>
					{#/if}
 					{#/for}
					</script>
				</div>
			</div>
		</div>
		<div id="content">
				<div class="breadcrumb">
					<a class="home" title="Home"
						href="http://dev09.usc.ecommera.demandware.net">Home</a> <span
						class="divider">&gt;</span> <span class="resultstext">Your
						Search results for:tomtom</span>
				</div>
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
												<a title="{$T.hit.image.title}" href="">
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
									<div>
										<a title="Add to cart" href="/addToCart">Add To Cart</a>
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

</div>
<!-- end of container div -->
<jsp:include page="mainFooter.jsp" />