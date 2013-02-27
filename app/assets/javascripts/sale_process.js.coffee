jQuery ->
	$("#click_to_search_client").click ->
		$("#my_search_client_box").show()

jQuery ->
	$(".close_box").click ->
		$(this).parents(".new_box").hide()

jQuery ->
	$(".clickable_row").click ->
		client_id = $(this).attr("id").substring(7)
		$("#client_id").val(client_id)
		$("#client_real_name").val($(this).find("td").html())
		number = $(this).find("td:last-child").html()
		prev = ""
		if number.length == 8
			prev = "DNI: "
		else
			prev = "RUC: "
		$("#client_number").html(prev + number)
		$(this).parents(".new_box").hide();

jQuery ->
	$("#search_client_text").keyup ->
		$("#test").html("")
		found = true
		toCheck = $(this).val().toLowerCase()
		$(".search_here_row").each ->
			name = $(this).find("td").html().toLowerCase()
			number = $(this).find("td:last-child").html()
			if name.search(toCheck) > -1
				found = false
				$(this).show()
			else
				$(this).hide()
			if found
				if number.search(toCheck) > -1
					$(this).show()
				else
					$(this).hide()

jQuery ->
	$("#sp_show_new_client_form").click ->
		$("#text_to_search").hide()
		$("#sp_client_data").hide()
		$(this).hide()
		$("#sp_new_client_form").show()