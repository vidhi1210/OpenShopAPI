<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
 

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Get the menu</title>
<script type="text/javascript">

function getCategory() {
	jQuery.ajax({
		type : "POST",
		url : "newmenu",
		dataType : "json",
		success : function(data) {
			alert("D");
			window.categories = data;
			
			alert("gg");
		}
	}
	);
 }
			
			
		//	jQuery(window.categories).find("categories").each(
		//			function() {
		//				jQuery("#category").append(
		//						jQuery(this).find(
		//								"categories:contains('id')")
		//								//.parent()
					//					.find('categories').append(":"));
		//		});
	//	}
//	});
//}
			
	//	;
				
					
			
		//}
	
	//});




	
</script>
</head>
<body>
	<form action="shop/v1/categories" method="post">
	<div id="navigation" class="categorymenu">

			
			

	</div>		
		
	</form>
	


</body>
</html>





