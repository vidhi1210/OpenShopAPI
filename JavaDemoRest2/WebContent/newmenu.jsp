<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<script type="text/javascript">
$(document).ready(function(){
	$('#navigation').setTemplate($("#menuTemplate").html());
	$('.categorymenu ul').addClass('sf-menu');			
	//$('ul.sf-menu').superfish({autoArrows	: false, dropShadows : false}).find('ul').bgIframe();
	$.ajax({
		type : "POST",
		url : "menu",
		dataType : "json",
		success : function(data) {
			$('#navigation').processTemplate(data);
		}
	 });
	});
	
</script>
<div id="navigation" class="categorymenu">
	<script type="text/html" id="menuTemplate">
		<ul class="sf-menu sf-js-enabled">
		{#foreach $T.categories as cat}	
			<li class=""><a href="/user/messages">{$T.cat.name}</a>
				<ul class="sf-menu sf-js-enabled">
					{#foreach $T.cat.categories as subcat}	
						<li><a href="/user/messages">{$T.subcat.name}</a></li>
					{#/for}
				</ul>
			</li>
		{#/for}
		</ul>
	</script>
</div>		