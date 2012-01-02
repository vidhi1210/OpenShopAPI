/*
 * All script logic for product comparison.
 *
 * The code relies on the jQuery JS library to be also loaded.
 *
 * The logic extends the JS namespace app.*
 */

(function(app){
	if (app) {
   		var products = [null, null, null, null, null, null];
   		var count = 0;
		var emptyImgSrc = '';
		var emptyImgAlt = '';
		var baseButtonLabel = '';
		var confirmationMessage = '';
		var openUrl = '';
		var addUrl = '';
		var removeUrl = '';
		var suppressRefresh = false;

		var refresh = function() {
			if (suppressRefresh) {
				return;
			}
			
	   		var buttonLabel = baseButtonLabel;
	   		if (count > 0) {
	   			buttonLabel += ' (' + count + ')';
	   		}
	
	   		var compareItemsButton = jQuery('#compareItemsButton');
	   		compareItemsButton.html(buttonLabel);
	   		compareItemsButton.each(function() {
	   			jQuery(this)[0].disabled = (count < 2);
	   		});
	
	   		jQuery('#clearComparedItemsButton').each(function() {
	   			jQuery(this)[0].disabled = (count < 2);
	   		});
	   		
	   		if (count > 0) {
	   			jQuery('#compareItems').show();
	   		} 
	   		else {
	   			jQuery('#compareItems').hide();
	   		}
	   	};
	
		var reset = function(options) {
			products = [null, null, null, null, null, null];
			count = 0;
			emptyImgSrc = options.emptyImgSrc;
			emptyImgAlt = options.emptyImgAlt;
			baseButtonLabel = options.baseButtonLabel;
			confirmationMessage = options.confirmation;
			openUrl = options.openUrl;
			addUrl = options.addUrl;
			removeUrl = options.removeUrl;

			refresh();
		};

		var addProductIndex = function(options) {
	   		var addIndex = count;
			products[addIndex] = {id:options.id, category:options.category, boxId: options.boxId};
	   		count++;
	   		return addIndex;
		};
		
		var setProductImage = function(options) {
			jQuery('#compareItemsProduct' + options.index).each(function() {
		   		var productImage = jQuery(this)[0];
				productImage.src = options.src;
				productImage.alt = options.alt;
			});

	   		jQuery('#compareItemsClear' + options.index).show();
		}
		
		app.compare = {
			initialize: function(options) {
				reset(options);

				// Buttons to remove compared products individually	
				for (var i = 0; i < 6; i++) {
					// new Function() syntax ensures loop index is used correctly
					jQuery('#compareItemsClear' + i).click(new Function('app.compare.removeProduct({index: ' + i + '})'));
				}
	
				// Button to go to compare page
				jQuery('#compareItemsButton').click(function() {
					window.location.href = options.openUrl;
				});
	
				// Button to clear all compared items
				jQuery('#clearComparedItemsButton').click(function() {
					suppressRefresh = true;

					jQuery('#compareItems').hide();
					
					for (var i = count - 1; i >= 0; i--) {
						app.compare.removeProduct({index: i});
					}

					suppressRefresh = false;

					refresh();
				});
	
				var checked = jQuery('input:checkbox[checked]');
				
				// given a pid, find the corresponding checkbox id
				var findBoxId = function(pid) {					
					for (var i = 0; i< checked.length; i++) {
						var data = jQuery(checked[i]).data("data");
						if (data != null && data.id === pid) {
							return data.boxId;
						}
					}
				}
					
				// Check checkboxes for compared products on the current page 
				for (var i = 0; i < options.products.length; i++) {
					var product = options.products[i];					
					var addIndex = addProductIndex({id:product.id, category:product.category, boxId: findBoxId(product.id)});
					setProductImage({index:addIndex, src:product.imgSrc, alt:product.imgAlt});					
				}
	
				refresh();
			},
	
			addProduct: function(options){
		  		if (count >= 6) {
		  			if (!confirm(confirmationMessage)) {
		  				jQuery('#' + options.boxId).each(function() {
		  					jQuery(this)[0].checked = false;
		  				});
		  				return;
		  			}
		
		  			app.compare.removeProduct({index: 0});
		  		}
		
		  		var complete = function() {
		  			var addIndex = addProductIndex(options);
		
		  			jQuery(options.img).each(function() {
						var thumbnail = jQuery(this)[0];
						setProductImage({index:addIndex, src:thumbnail.src, alt:thumbnail.alt});
		  			});
	
			   		refresh();
		  		};
		
				var uncheck = function() {
	  				jQuery('#' + options.boxId).each(function() {
	  					jQuery(this)[0].checked = false;
	  				});
				};
	
		   		jQuery.ajax({
					type: 'POST',
					url: addUrl,
					data: {'pid':options.id, 'category':options.category},
					dataType: 'json',
					success: function(data){
						if (data.success === true) {
							complete();
						}
						else {
							uncheck();
						}
					},
					failure: function(data) {
						uncheck();
					}
				});
			},
	
			removeProduct: function(options) {
				var index = null;
				if (options.index != null) {
					index = options.index;
				}
				else {
			   		for (var i = 0; i < count; i++) {
			   			if (products[i].id === options.id) {
			   				index = i;
			   			}
			   		}
				}
	
				var clearedProduct = products[index];
	
				var complete = function() {
			   		for (var i = index; i < count - 1; i++) {
			   			products[i] = products[i + 1];
	
		  				jQuery('#compareItemsProduct' + (i + 1)).each(function() {
							var thumbnail = jQuery(this)[0];
	
			  				jQuery('#compareItemsProduct' + i).each(function() {
						   		var productImage = jQuery(this)[0];
								productImage.src = thumbnail.src;
								productImage.alt = thumbnail.alt;
			  				});
		  				});
			   		}
	
					var clearedIndex = count - 1;
			   		products[clearedIndex] = null;
			   		count--;
			
	  				jQuery('#' + clearedProduct.boxId).each(function() {
	  					jQuery(this)[0].checked = false;
	  				});

	  				jQuery('#compareItemsProduct' + clearedIndex).each(function() {
	  					var productImage = jQuery(this)[0];
				   		productImage.src = emptyImgSrc;
				   		productImage.alt = emptyImgAlt;
	  				});
	
			   		jQuery('#compareItemsClear' + clearedIndex).hide();
			
			   		refresh();
				};
	
				var check = function() {
	  				jQuery('#' + clearedProduct.boxId).each(function() {
	  					jQuery(this)[0].checked = true;
	  				});
				};
	
		   		jQuery.ajax({
					type: 'POST',
					url: removeUrl,
					data: {'pid':clearedProduct.id, 'category':clearedProduct.category},
					dataType: 'json',
					async: false,
					success: function(data){
						if (data.success === true) {
							complete();
						} else {
							check();
						}
					},
					failure: function(data) {
						check();
					}
				});
			}
		}
	} else {
		// namespace has not been defined yet
		alert("app namespace is not loaded yet!");
	}
})(app);