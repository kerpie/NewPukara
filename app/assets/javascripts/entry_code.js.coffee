jQuery -> 
	$("#error_message").hide()
	$("#success_message").hide()

jQuery -> 
	$("#alert").hide()

jQuery ->
	$("#submit_entry_code_search").click ->
		$(this).next("input").trigger('click')