<jsp:include page="header.jsp" />
<script type="text/javascript">
	$(document).ready(function() {
		$('#cartContainer').setTemplate($("#cartTemplate").html());
		$('#ordertotals').setTemplate($("#cartOrderTemplate").html());
		$.ajax({
			type : "GET",
			url : "viewCart",
			dataType : "json",
			success : function(data) {
				$('#cartContainer').processTemplate(data);
				$('#ordertotals').processTemplate(data);
			}
		});
	});
</script>


<div id="main">
	<div id="content">
		<div class="breadcrumb">
			<a title="Home" href="index.jsp">Home</a> <span class="divider">&gt;</span>
			<a title="Cart" href="">Cart</a>
		</div>
		<div class="cart">
			<h1>Your Shopping Cart</h1>
			<fieldset>
				<legend>
					<span class="hide">Your Shopping Cart</span>
				</legend>
				<table summary="Cart" class="carttable">
					<thead>
						<tr>
							<th colspan="2">Product</th>
							<th colspan="2">Qty</th>
							<th>Price</th>
						</tr>
					</thead>
					<tbody id="cartContainer">
						<script type="text/html" id="cartTemplate">
						{#foreach $T.product_items as item}
						<tr class="tablerow">
							<td class="imagecolumn"><img width="75" height="75"
								title="{$T.item.item_text}" class=""
								alt="{$T.item.item_text}"
								src="http://demo.ocapi.demandware.net/on/demandware.static/Demos-SiteGenesis-Site/Demos-apparel-catalog/default/v1318523571600/images/large/10160_242.jpg">
							</td>
							<td class="detailscolumn">
								<div class="product">
									<div class="name">
										<a title=""	href="productView.jsp?product_id={$T.item.product_id}">{$T.item.item_text}</a>
									</div>
									<div class="productattributes">
										<div class="productid">
											<span class="label">Item No: </span> <span class="value">{$T.item.product_id}</span>
											<div class="clear"></div>
										</div>
									</div>
								</div>
							</td>
							<td class="quantitycolumn">
								<span class="value">{$T.item.quantity}</span>
							</td>
							<td class="quantitycolumndetails">
								<span>Remove</span>
								<br> <span class="imagebutton addtowishlist">Add to Wishlist</span> 
								<br> <span class="imagebutton addtoregistry">Add to Gift Registry</span>
								<div class="stockstate">
									<ul>
										<li class="isinstock">In Stock</li>
									</ul>
								</div> <!-- END: stockstate -->
							</td>
							<td class="itemtotalcolumn">
								<div class="itemtotals">
									<span class="value">{$T.item.price}&nbsp;{$T.currency}</span>
									<div class="itemtotal">
										 <span class="value">{$T.item.price}&nbsp;{$T.currency}</span>
									</div>
									<!-- END: itemtotal -->
								</div>
							</td>
						</tr>
						{#/for}
						</script>
					</tbody>
				</table>
				<div class="tfoot"></div>
				<div class="cartfooter">
					<div class="cartordertotals">
						<div class="formactions">
							<span>Update Cart</span>
						</div>

						<div id="ordertotals" class="ordertotals">
							<script type="text/html" id="cartOrderTemplate">
							<table summary="Order Totals Table" class="ordertotalstable">
								<tbody>
									<tr class="ordersubtotal">
										<th><span class="label">Order Subtotal:</span></th>
										<td><span class="value">{$T.product_sub_total}&nbsp;{$T.currency}</span>
										</td>
									</tr>
									<tr class="ordershipping">
										<th><span class="label">Shipping: 
											<span class="shippingname"> <!-- Display Shipping Method -->
											</span> </span>
										</th>
										<td><span class="value"> <!--  ELSE: Show as Empty -->

										</span></td>
									</tr>

									<tr class="ordersalestax">
										<th><span class="label">Sales Tax:</span></th>
										<td><span class="value"> <!--  ELSE: Show as Empty -->
										</span></td>
									</tr>
									<tr class="ordertotal">
										<th><span class="label">Estimated Total:</span></th>
										<td><span class="value">{$T.product_total}&nbsp;{$T.currency}</span></td>
									</tr>
								</tbody>
							</table>
							</script>
						</div>
						<!-- END: ordertotals -->

					</div>
					<!-- END: cartordertotals -->
				</div>
				<!-- END: cartfooter -->
			</fieldset>
			<div class="actions">

				<form id="dwfrm_cart_d0rohhtleobd" method="post"
					action="checkoutCart" class="formcheckout">
					<fieldset>
						<legend>
							<span class="hide">Your Shopping Cart</span>
						</legend>


						<button name="dwfrm_cart_checkoutCart" value="Checkout"
							type="submit" class="imagebutton continuecheckout">
							<span>Checkout</span>
						</button>

					</fieldset>
				</form>


				<fieldset>
					<a href="index.jsp"><span class="formcontinueshopping">Continue Shopping</span></a>
				</fieldset>
				<div class="clear">
					<!-- FLAOT CLEAR -->
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp" />