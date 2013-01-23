jQuery ->
	$("#click_to_search_client").click ->
		$("#my_search_client_box").show()

jQuery ->
	$(".close_box").click ->
		$(this).parents(".new_box").hide()