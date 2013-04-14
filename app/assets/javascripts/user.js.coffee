jQuery ->
	$('#user_name').keyup ->
		value = $(this).val()
		name_result = ""
		if(value.length > 0)
			valArray = value.split(" ");
			for tmp in valArray
				if tmp.length > 0
					name_result = name_result + tmp[0] 
		value = $("#user_last_name").val()
		lname_result = ""
		if(value.length > 0)
			valArray = value.split(" ");
			tmp = valArray[1]
			lname_result = valArray[0]
		$("#user_username").val(name_result + lname_result)

jQuery ->
	$('#user_last_name').keyup ->
		value = $(this).val()
		lname_result = ""
		if(value.length > 0)
			valArray = value.split(" ");
			lname_result = valArray[0]

		value = $('#user_name').val()
		name_result = ""
		if(value.length > 0)
			valArray = value.split(" ");
			for tmp in valArray
				if tmp.length > 0
					name_result = name_result + tmp[0] 
		$("#user_username").val(name_result + lname_result)

jQuery ->
	$('#user_dni').keyup ->
		value = $(this).val()
		if value.length < 9
			$(this).val(value)
		else
			$(this).val(value.substring(0,8))