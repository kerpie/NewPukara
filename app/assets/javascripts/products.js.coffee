typingTimer = null
doneTypingInterval = 3000

jQuery -> 
	$('#toHide').hide();

jQuery -> 
	model_types = $("#model_type_id").html()
	$("#myClass").change ->
		parent_model = $("#myClass :selected").text()
		options = $(model_types).filter("optgroup[label=#{parent_model}]").html()
		if(options)
			$('#model_type_id').html(options)
		else
			$('#model_type_id').empty()

doneTyping = () ->
	alert $("#brand_id").val()

jQuery ->
	$("#brand_id").keyup ->
		clearTimeout(typingTimer)
		if($("#brand_id").val)
			typingTimer = setTimeout(doneTyping, doneTypingInterval)
		