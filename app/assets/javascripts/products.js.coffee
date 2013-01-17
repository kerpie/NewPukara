typingTimer = null
doneTypingInterval = 1000

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
	$("#submiting").find("input").trigger('click');

jQuery ->
	$("#brand_id").keyup ->
		clearTimeout(typingTimer)
		if($("#brand_id").val)
			typingTimer = setTimeout(doneTyping, doneTypingInterval)

jQuery ->
	$("#model_type_id").change -> 
		$("#submiting").find("input").trigger('click');

submitModelChanger = (link) ->
	$(link).parent().next("#model_changer_submit").find("input").trigger('click');

jQuery ->
	$("#to_show_sell_price_register_form").click ->
		if($(this).hasClass("shown"))
			$(this).next("form").hide()
			$(this).html("Modificar precios de venta")
			$(this).removeClass("shown")
		else
			$(this).next("form").show()
			$(this).html("Ocultar formulario de ingreso")
			$(this).addClass("shown")