jQuery -> 
	$("#click_to_pay").click ->
		$("#pay_quotation_part").show()

jQuery ->
	$("#csfnq").keyup ->
		valueToCheck = $(this).val()
		$("#client_list_fnq tr").each ->
			found = false
			if $(this).find("td:first-child").text().search(new RegExp(valueToCheck, "i")) < 0
				$(this).hide()
			else
				$(this).show()
				found = true
			if found == false
				if $(this).find("td:last-child").text().search(new RegExp(valueToCheck, "i")) < 0
					$(this).hide()
				else 
					$(this).show()


jQuery ->
	$(".clickable_row").click ->
		$("#client_name").val($(this).find("td:first-child").text())
		$("#client_real_id").val($(this).attr("id"))
