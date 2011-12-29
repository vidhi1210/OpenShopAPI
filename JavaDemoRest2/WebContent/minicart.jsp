<script type="text/javascript">
$(document).ready(function(){ 
	$('#miniCartMain').setTemplate($("#miniCartTemplate").html() ) ;
	$.ajax({
			type : "GET",
			url : "viewMiniCart",
			dataType : "json",
			success : function(data) {
				$('#miniCartMain').processTemplate(data);
			}
		});
});
</script>
<div id="minicart" class="minicart">
	<div class="minicarttotal" id="miniCartMain">
		<span class="cartlabel hide" >Cart:</span>
			<script type="text/html" id="miniCartTemplate">
			<a class="linkminicart" title="View Cart" href="viewCart.jsp">
			{#if $T.product_items.length == 0}
				<span class="emptycart">Empty</span>
			{#else}
				<a class="linkminicart" title="View Cart" href="viewCart.jsp">
				{$T.product_items.length}&nbsp;Item,&nbsp;
				<span class="totallabel">Total:</span>
				&nbsp;{$T.product_total}
				</a>
			{#/if}
			</a>
		</script>
	</div>
</div>
