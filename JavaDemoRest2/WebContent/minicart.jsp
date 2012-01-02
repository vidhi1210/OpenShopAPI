<script type="text/javascript">
$(document).ready(function(){ 
		updateMiniCart(null);
});

function updateMiniCart(data){
	
	var strMiniCart = 	'<span class="emptycart">Empty</span>';
	
	if(data != null && data.product_items != null && data.product_items.length > 0) {
		strMiniCart = '<a class="linkminicart" title="View Cart" href="viewCart.jsp">' + 
					data.product_items.length + '&nbsp;Item,&nbsp;<span class="totallabel">Total:</span>&nbsp;' + data.product_total + '</a>';
	}
	
	$('#miniCartTotalDiv').html(strMiniCart);
}

</script>
<div id="minicart" class="minicart">
	<div class="minicarttotal" id="miniCartTotalDiv">
	</div>
</div>
