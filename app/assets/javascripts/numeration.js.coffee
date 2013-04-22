jQuery ->
	$("#select_store_for_numeration").change ->
		value = $(this).val()
		$(".order_by_store").each ->
			if $(this).attr('id') != value
				$(this).hide()
			else
				$(this).show()

jQuery ->
	$("#initial_number").keyup ->
		value = $(this).val()
		value = value.replace(/[a-z]/,"")
		$(this).val(value)
		$("#current_number").val(value)

jQuery ->
	$("#current_number").keyup ->
		value = $(this).val()
		value = value.replace(/[a-z]/, "")
		$(this).val(value)