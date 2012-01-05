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
								<li class="expandable"><a class="refineLink " href="productSearchResult.jsp?refine_1=cgid={$T.val.value}&q=<%= request.getParameter("q")%>" title="{$T.val.value}">{$T.val.value}</a></li>
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
										<a class="refineLink" href="productSearchResult.jsp?refine_1=price={$T.val.value}&q=<%= request.getParameter("q") %>">{$T.val.label}</a>
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