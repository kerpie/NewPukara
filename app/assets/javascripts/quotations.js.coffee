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
			$("#q_address").html($("#q_2 table tbody tr.shown").first().attr("data-address"))
			$("#identification_type_part").html($("#q_2 table tbody tr.shown").first().find("td:first-child").next().text())
			$("#q_identification_number").html($("#q_2 table tbody tr.shown").first().find("td:last-child").text())
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
	$("#q_client_name").keyup ->
		unless $(this).val().length != 0
			$("#quotation_client_id").val("")		
			$("#q_clients_list").show()
			$("#q_client_search").focus()		

jQuery ->
	$("#q_2 table tbody tr").click ->
		$("#quotation_client_id").val($(this).attr("id"))
		$("#q_client_name").val($(this).find("td:first-child").text())
		$("#q_address").html($(this).attr("data-address"))
		$("#identification_type_part").html($(this).find("td:first-child").next().text())
		$("#q_identification_number").html($(this).find("td:last-child").text())
		passClientData()

passClientData = () ->
	$("#q_clients_list").hide()
	$("#q_client_name").focus()
	$("#q_client_search").val("")

#Buscar producto para cotizacion

jQuery ->
	$(".in_product input").focus ->
		if $(this).val() == ""
			$("#q_product_search").show()

jQuery ->
	$("#qp_search_input").click ->
		if $(this).val() == "MAQUINA SIRUBA REMALLADORA"
			$(this).val("")

jQuery ->
	$("#qp_search_input").blur ->
		if $(this).val().length == 0
			$(this).val("MAQUINA SIRUBA REMALLADORA")

jQuery ->
	$("#qp_search_input").keyup (event)->
		if event.which == 27
			$(this).parents(".q_box").hide();