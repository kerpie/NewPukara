jQuery ->
	$("#q_client_search").keyup (event)->
		tts = $(this).val()
		$("#q_2 table tbody tr").each ->
			found = false
			if($(this).find("td:first-child").text().search(new RegExp(tts, "i")) < 0)
				$(this).removeClass("shown")
				$(this).hide()
			else
				$(this).show()
				$(this).addClass("shown")
				found = true
			if(found == false)
				if($(this).find("td:last-child").text().search(new RegExp(tts, "i")) < 0)
					$(this).removeClass("shown")
					$(this).hide()
				else
					$(this).show()
					$(this).addClass("shown")
		if event.which == 13
			$("#quotation_client_id").val($("#q_2 table tbody tr.shown").first().attr("id"))
			$("#q_client_name").val($("#q_2 table tbody tr.shown").first().find("td:first-child").text())
			passClientData()
		if event.which == 27
			$(this).parents(".q_box").hide()

jQuery ->
	$("#q_client_name").click ->
		unless $(this).val().length != 0
			$("#quotation_client_id").val("")		
			$("#q_clients_list").show()
			$("#q_client_search").focus()

jQuery ->
	$("#q_2 table tbody tr").click ->
		$("#quotation_client_id").val($(this).attr("id"))
		$("#q_client_name").val($(this).find("td:first-child").text())
		$("#q_address").text($(this).attr("data-address"))
		passClientData()

passClientData = () ->
	$("#q_clients_list").hide()