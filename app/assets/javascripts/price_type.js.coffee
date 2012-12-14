jQuery -> 
	$(".price_type_edit_image").live "click", ->
		if($(this).hasClass("pt_up_shown"))
 			$(this).removeClass("pt_up_shown")
 			$(this).parents(".price_type_item").next(".update_price_type").hide()
 		else
 			$(this).addClass("pt_up_shown")	
 			$(this).parents(".price_type_item").next(".update_price_type").show()