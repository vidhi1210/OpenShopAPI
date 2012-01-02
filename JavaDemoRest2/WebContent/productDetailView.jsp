<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp" />
<title>Online Shop : Product Search Result</title>
<script type="text/javascript" src="lib/js/product.js"></script>
<script type="text/javascript">
$(document).ready(function(){ 
	$('#pdpMain').setTemplate($("#productDetailTemplate").html() );
	var param = "<%=request.getParameter("product_id")%>";
		$.ajax({
			type : "GET",
			url : "productView?product_id=" + param,
			dataType : "json",
			success : function(data) {
				$('#pdpMain').processTemplate(data);
			}
		});
	});


function addToCart() {
	jQuery.ajax({
		type : "POST",
		url : "addToCart",
		dataType : "json",
		data: {"product_id":"882763039226","quantity": +  $('#quantity').val()},
		success : function(res){
			updateMiniCart(res);
		}
	});
}	
</script>

<div id="container" class="pt_productsearchresult">
	<div id="main">
		<jsp:include page="searchRefinements.jsp" />
		<div id="content">
			<jsp:include page="breadCrumb.jsp" />
			<div id="pdpMain" class="productdetail">
				<script type="text/html" id="productDetailTemplate">
					<div class="productdetailcolumn productinfo">
						<h1 class="productname">{$T.name}</h1>
						<div class="itemNo productid">Item# 882763039226</div>
						<div class="pricing">
							<div class="price">
								<div class="salesprice">{$T.price}</div>
							</div>
						</div>
						<div class="promotion"></div>
						<div class="variationattributes">
							<div class="swatches color"></div>
							<div class="clear"></div>
							<div class="swatches shoeWidth"></div>
							<div class="clear"></div>
							<div class="swatches shoeSize"></div>
							<div class="clear"></div>
						</div>
						<!-- END: variationattributes -->

						<div class="mainattributes">
							<div class="clear"></div>
						</div>
						<div class="availability">
							<span class="label">Availability: </span> <span class="value">In
								Stock</span>
						</div>
						<!-- END: availability -->

						<div id="pdpATCDivpdpMain" class="addtocartbar">
							<div class="addtocart">
								<input id="pid" name="pid" value="882763039226" type="hidden">

								<div class="quanity">
									<label class="label" for="quantity">Qty:</label><input
										id="quantity" name="Quantity" class="quantityinput" value="1">
								</div>
								<!-- END: quanity -->


								<input type="button" title="Select Size" value="Add to Cart" onClick="addToCart();" class="addtocartbutton">
								</input>
							</div>
							<div class="pricing">
								<div class="price">
									<div class="salesprice">{$T.price}</div>
								</div>
							</div>
						</div>
						<!-- END: addtocartbar -->
						<div class="productactions">
							<div class="addtowishlist">
								<a href="#"> Add to Wishlist</a>
							</div>
							<div class="addtoregistry">
								<a href="#"> Add to Gift Registry</a>
							</div>

							<div class="sendtofriend">
								<a>Send to a Friend</a>
							</div>
						</div>
						<!-- END: productactions -->
						<div class="productreview">
							<div class="review_links">
								<a id="pdpReadReview" title="Read Reviews">Read Reviews</a><span
									class="divider">|</span><a id="pdpWriteReview"
									href="/on/demandware.store/Sites-shared-Site/default/PowerReviews-WriteReview?pid=882763039226"
									title="Write a Review">Write a Review</a>
							</div>
							<!-- END: review_links -->

						</div>
						<!-- END: productreview -->
						<div class="clear">
							<!-- FLOAT CLEAR -->
						</div>
					</div>
					<!-- END: productdetailcolumn -->
					<div class="productdetailcolumn productimages">
						{#foreach $T.image_groups as image_group} 
							{#foreach $T.image_group.images as image}
							<div style="position: relative;" class="productimage">
								<a title="" alt="{$T.image.alt}"
									style="outline-style: none; cursor: crosshair; display: block; position: relative; width: 350px; height: 350px;"
									id="jqzoom" href="{$T.image.link}"> <img title=""
									alt="{$T.image.link}" id="jqzoom_img" src="{$T.image.link}">
								</a>
							</div>
							{#break} 
							{#/for} 
						{#break} {#/for}
						<div class="productthumbnails"></div>
						<div class="maywerecommend"></div>
						<div class="clear"></div>
					</div>
					<!-- END: productdetailcolumn -->
					<div class="clear">
						<!-- FLOAT CLEAR -->
					</div>
				<div id="pdpTabsDiv" class="product_tabs ui-tabs ui-widget ui-widget-content ui-corner-all">
					<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
						<li
							class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a
							href="#pdpTab1"><span>Description</span> </a>
						</li>
						<li class="ui-state-default ui-corner-top"><a href="#pdpTab2"><span>Product
									Details</span> </a>
						</li>
						<li class="ui-state-default ui-corner-top"><a
							href="#pdpReviewsTab"><span>Reviews</span> </a>
						</li>
					</ul>
					<div class="ui-tabs-panel ui-widget-content ui-corner-bottom" id="pdpTab1">
						<noscript>
							<h2>Description</h2>
						</noscript>
						<a class="printpage">Print</a>{$T.short_description}
					</div>
					<div
						class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="pdpTab2">
						<noscript>
							<h2>Product Details</h2>
						</noscript>
						<a class="printpage">Print</a>{$T.long_description}
					</div>
					<div class="ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide" id="pdpReviewsTab">
						<noscript>
							<h2>Reviews</h2>
						</noscript>
						<a class="printpage">Print</a>
						<a name="prReview"></a>
						<h2>Product Reviews</h2>
					</div>
				</div>
				</script>
			</div>
		</div>
	</div>
</div>


<!-- end of main -->
<jsp:include page="footer.jsp" />


<!-- end of container div -->
<jsp:include page="mainFooter.jsp" />