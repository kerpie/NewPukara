jQuery ->
	$("#client_client_type_id").change ->
		if (parseInt($(this).val()) == 4)
			$("#client_DNI").parent().hide()
			$("#client_RUC").parent().show()
		else
			$("#client_DNI").parent().show()
			$("#client_RUC").parent().hide()
