jQuery -> 
	$(".document_type_edit_image").live "click", ->
		if($(this).hasClass("dt_up_shown"))
 			$(this).removeClass("dt_up_shown")
 			$(this).parents(".document_type_item").next(".update_document_type").hide()
 		else
 			$(this).addClass("dt_up_shown")	
 			$(this).parents(".document_type_item").next(".update_document_type").show()