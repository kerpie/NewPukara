jQuery ->
	$("#client_type_id").change ->
		$("#client_identification_number").val("")

jQuery ->
	$("#client_identification_number").keyup (event)->
		value = $(this).val()
		key = event.which
		if(key > 31 && (key < 48 || key > 57))
			alert "Solo numeros son permitidos"
			$("#client_identification_number").val(value.substring(0,parseInt(value.length)-1))
			return false
		limit = parseInt($("#client_type_id").find("option:selected").attr("data-limit"))
		if (value.length < (limit + 1))
			$(this).val(value)
		else
			$(this).val(value.substring(0,limit))