<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="header.jsp" />
<title>Online Shop : Product Search Result</title>

<script type="text/javascript">
	$(document).ready(
			function() {
				$('#orderConfirmationDiv').setTemplate($("#orderConfirmationTemplate").html());
				$('#orderConfirmationDiv').processTemplate(<%= request.getAttribute("orderconfirmation") %>);
			});
</script>

<div id="container" class="pt_productsearchresult">
	<div id="main">
		<div class="orderconfirmation">
			<div class="thankyoumessage">
				<h2>Thank you for your order.</h2>
				<p>If you have questions about your order, we're happy to take
					your call</p>
				<p>(012-345-6789) Monday - Friday 8AM - 8PM</p>
				<p>
					<a class="printpage">Print Receipt</a>
				</p>
			</div>
			<!-- END: thankyoumessage -->
			<div class="orderconfirmationdetails" id="orderConfirmationDiv">
			<script id="orderConfirmationTemplate" type="text/html">
				<div class="orderheader">
					<div class="orderdate">
						<span class="label">Order Placed:</span> <span class="value">3/1/12</span>
						<div class="clear">
							<!--  FLOAT CLEAR -->
						</div>
					</div>
					<!-- END: orderdate -->
					<div class="ordernumber">
						<span class="label">Order Number:</span> <span class="value">{$T.order_number}</span>
						<div class="clear">
							<!--  FLOAT CLEAR -->
						</div>
					</div>
					<!-- END: ordernumber -->
				</div>
				<!-- END: orderheader -->
				<div class="orderpayment">
					<h2>Payment Information</h2>
					<div class="orderpaymentdetails">
						<table class="orderpaymentdetailstable"
							summary="Order Payment Details">
							<tbody>
								<tr>
									<td class="orderbilling">
										<div class="label">Billing Address:</div>
										<div class="miniaddress">
											<div class="name">
												<span class="firstname">{$T.billing_address.first_name}</span> <span class="lastname">{$T.billing_address.last_name}</span>
											</div>
											<!-- END: name -->
											<div class="address">
												<div class="street">
													<div class="line1">{$T.billing_address.address1}</div>
												</div>
												<!-- END: street -->
												<div class="location">
													<span class="city">{$T.billing_address.city}</span><span class="statedivider">,&nbsp;</span>
													<span class="state">AK&nbsp;</span> <span class="zip">{$T.billing_address.postanl_code}</span>
												</div>
												<!-- END: location -->
												<div class="country">United States</div>
												<div class="phone">Phone:&nbsp;333-333-3333</div>
											</div>
											<!-- END: address -->
										</div> <!-- END: miniaddress -->
									</td>
									<td class="orderpaymentinstruments">
										<div class="label">Payment Method:</div>
										<div class="minicreditcard">
											<div class="owner">{$T.payment.payment_card.holder}</div>
											<div class="type">{$T.payment.payment_card.card_type</div>
											<div class="number">{$T.payment.payment_card.number</div>
										</div>
										<div class="paymentamount">
											<span class="label">Amount:</span> <span class="value">{$T.product_sub_total}</span>
										</div> <!-- END: paymentamount -->
									</td>
									<td class="orderpaymentsummary">
										<div class="label paymenttotal">Payment Total:</div>
										<div class="orderdetailsummary">
											<div class="ordertotals">
												<table class="ordertotalstable" summary="Order Totals Table">
													<tbody>
														<tr class="ordersubtotal">
															<th><span class="label">Order Subtotal:</span></th>
															<td><span class="value">{$T.product_sub_total}</span>
															</td>
														</tr>
														<tr class="ordershipping">
															<th><span class="label">Shipping: <span
																	class="shippingname"> <!-- Display Shipping Method -->
																		Express </span> </span>
															</th>
															<td><span class="value"> £16.99 </span></td>
														</tr>
														<tr class="ordersalestax">
															<th><span class="label">Sales Tax:</span></th>
															<td><span class="value">£3.31</span></td>
														</tr>
														<tr class="ordertotal">
															<th><span class="label">Order Total:</span></th>
															<td><span class="value">£69.49</span></td>
														</tr>
													</tbody>
												</table>
											</div>
											<!-- END: ordertotals -->
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- END: orderpaymentdetails -->
				</div>
				<!-- END: orderpayment -->
				<div class="ordershipments">
					<div class="ordershipment">
						<table class="ordershipmenttable" summary="Order Shipment">
							<thead>
								<tr>
									<th><abbr title="Product">Product</abbr></th>
									<th><abbr title="Quantity">Quantity</abbr></th>
									<th><abbr title="Price">Price</abbr></th>
									<th><abbr title="Shipping Details">Shipping</abbr></th>
								</tr>
							</thead>

							<tbody>
								<tr class="productrow">
									<td>
										<div class="product">
											<div class="name">
												<a
													href="http://dev09.usc.ecommera.demandware.net/Men%27s-Power-Lounger-Low/882763039172,default,pd.html"
													title="Men's Power Lounger Low">Men's Power Lounger Low</a>
											</div>
											<div class="promo">- Test Promo</div>
											<div class="clear">
												<!-- FLOAT CLEAR -->
											</div>
											<div class="productattributes">
												<div class="productid">
													<span class="label">Item No: </span> <span class="value">882763039172</span>
													<div class="clear">
														<!-- FLOAT CLEAR -->
													</div>
												</div>
												<div class="attribute">
													<span class="label">Color:</span> <span class="value">Dark
														Brown Smooth </span>
													<div class="clear">
														<!-- FLOAT CLEAR -->
													</div>
												</div>
												<div class="attribute">
													<span class="label">Width:</span> <span class="value">
														M </span>
													<div class="clear">
														<!-- FLOAT CLEAR -->
													</div>
												</div>

												<div class="attribute">
													<span class="label">Size:</span> <span class="value">
														6.5 </span>
													<div class="clear">
														<!-- FLOAT CLEAR -->
													</div>
												</div>
											</div>
											<!-- END: productattributes -->
										</div>
										<div style="display: none">100 24 of 24</div></td>
									<td>1</td>
									<td>£52.50</td>
									<td rowspan="1" class="ordershipmentdetails">
										<div class="ordershipmentaddress">
											<div class="label">Shipping Address:</div>
											<div class="summarybox">
												<div class="name">
													<span class="firstname">Anant</span> <span class="lastname">Patel</span>
													<div class="street">
														<div class="line1">21 ABC</div>
													</div>
													<!-- END:street -->
													<div class="location">
														<span class="city">Alaska</span> <span
															class="statedivider">,&nbsp;</span> <span class="state">AK&nbsp;</span>
														<span class="zip">12345</span>
													</div>
													<!-- END:location -->
													<div class="country">United States</div>
												</div>
												<!-- END:name -->
											</div>
										</div>
										<div class="shippingmethod">
											<span class="label">Method:</span> <span class="value">Express</span>

										</div>
										<div class="shippingstatus">
											<span class="label">Shipping Status:</span> <span
												class="value">Not Shipped</span>

										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- END: ordershipment -->
				</div>
				<!-- END: orderpayment -->
				</script>
			</div>
			<div class="actions">
				<a
					href="http://dev09.usc.ecommera.demandware.net/on/demandware.store/Sites-shared-Site/default/Cart-ContinueShopping">
					<!-- dwMarker="link" dwPipelineTitle="Cart-ContinueShopping (app_sg)" dwPipelineURL="http://localhost:60606/target=/c/app_sg/p/Cart-ContinueShopping" -->Return
					to Shopping</a>
			</div>
		</div>
		<!-- END: orderconfirmation -->
	</div>
		<!-- end of main -->
	<jsp:include page="footer.jsp" />
</div>
	<jsp:include page="mainFooter.jsp" />