typingTimer = null
doneTypingInterval = 500

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
	$("#brand_id").change ->
		clearTimeout(typingTimer)
		if($("#brand_id").val())
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

jQuery ->
	$("#search_product_in_index").click ->
		if($(this).val() == "Buscar por modelo")
			$(this).val("")

jQuery ->
	jQuery ->
	$("#search_product_in_index").blur ->
		if $(this).val().length == 0
			$(this).val("Buscar por modelo")

jQuery -> 
	$("#search_product_in_index").keyup ->
		textToSearch = $(this).val().toUpperCase()
		$("#products ul li").each ->
			if($(this).find(".explanation table tr:last-child td:last-child").text().search(new RegExp(textToSearch, "i"))< 0)
				$(this).hide()				
			else
				$(this).show()			