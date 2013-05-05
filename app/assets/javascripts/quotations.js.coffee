id_row = ""
unit_id = ""
unit_changed = false

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
			$("#q_contact_to").html($("#q_2 table tbody tr.shown").first().attr("data-contact_person"))
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
		$("#q_contact_to").html($(this).attr("data-contact_person"))
		passClientData()

passClientData = () ->
	$("#q_clients_list").hide()
	$("#q_client_name").focus()
	$("#q_client_search").val("")

#Buscar producto para cotizacion

jQuery ->
	$(".in_product input").live "focus",->
		if $(this).val() == ""
			$("#q_product_search").show()
			$("#qp_search_input").focus()
			id_row = $(this).parents(".qd").attr("id")

jQuery ->
	$("#qp_search_input").keyup (event)->
		if event.which == 27
			$(this).parents(".q_box").hide()

jQuery ->
	$("#product_quantity").keyup (event)->
		if event.which == 27
			$(this).parents(".q_box").hide()
		if event.which == 13
			if(unit_changed && unit_id.length>0)
				quantity = $(this).val()
				total_stock = totalStock()
				if quantity > total_stock
					alert "No puede pedir mas de lo que hay en los almacenes"
					return
				if $(".my_store").text().length == 0 or quantity > parseInt($(".my_store").text())
					unit = $("#product_quantity").next("select").find("option:selected").attr("data-unit_value")
					my_store_value = $(".my_store").text()
					message = "" 
					
					if my_store_value.length == 0
						message = "Estas pidiendo "+quantity+" unidades y no hay unidades en tu almacen"
					else
						message = "Estas pidiendo "+quantity+" unidades y solo hay " + parseInt(my_store_value)+ " unidades en tu almacen"

					$("#afp_down h2").text(message)
					$("#ask_for_product").show()
					$(".my_message_to_other_store").each ->
						$(this).val("Necesito "+ "         unidades de " + $("#qp_full_name").text())
					$(this).parents(".q_box").hide()
				$("#downer").show()
				$("#product_price").attr("readonly", true)
				$("#product_price").focus()
			else
				alert "Elige una unidad"

jQuery ->
	$("#downer table tbody tr").live "click", ->
		$(this).parent().find('tr').each ->
			$(this).removeClass("guess_who_is_selected")
		$(this).addClass("guess_who_is_selected")
		$("#downer table tbody tr").each ->
			$(this).removeClass("here")
		$(this).addClass("here")
		$("#downer div h2").show()
		$("#downer div h2").html("Descuento maximo: " + parseFloat($(this).attr("id")) * 100 + "%")
		$("#product_price").attr("readonly", false)
		$("#product_price").focus()

jQuery ->
	$("#product_price").keyup (event)->

		#ALMACENAR ID DEL TIPO DE PRECIO

		val = $(this).val()
		if event.which == 13
			discount = parseFloat($("#downer table tbody tr.here").attr("id"))
			price = parseFloat($(".this_is_the_price").html())
			if val < (price - price*discount)
				alert("El precio no puede ser menor al establecido con el descuento")
				$(this).val("")
			else
				$(this).parents(".q_box").hide()
				$("#"+id_row).find(".quantity_goes_here input").val(				$("#product_quantity").val()											)		 
				$("#"+id_row).find(".price_goes_here input").val(					$(this).val()															)
				$("#"+id_row).find(".price_goes_here input[type=hidden]").val(		unit_id																	)
				$("#"+id_row).find(".total_goes_here input").val(					parseFloat($(this).val())*parseFloat($("#product_quantity").val())		)
				$("#"+id_row).find(".product_goes_here .tmp").val(					$("#qp_full_name").text()												)
				$("#"+id_row).find(".product_goes_here input[type=hidden]").val(	$("#this_is_the_product_id_you_shouldnt_be_seeing").val()				)
				$("#"+id_row).find(".money_type_goes_here input[type=hidden]").val(	$(".guess_who_is_selected").find("td:last-child").attr("id")			)
				$("#"+id_row).find(".money_type_goes_here span").text(				$(".guess_who_is_selected").find("td:last-child").text()				)
				$("#"+id_row).find(".price_goes_here .my_money_value").val(		$(".guess_who_is_selected").find("td:last-child").attr("data-value")	)
				$(this).val("")
				$("#product_quantity").val("")
				add_prices_to_form()
		if event.which == 27
			$(this).parents(".q_box").hide()
			
jQuery ->
	$("#product_unit").change ->
		if $("#product_quantity").val().length > 0
			unit_changed = true
			unit_id = $(this).val()
			unit = $(this).find("option:selected").attr("data-unit_value")
			$("#product_quantity").val(parseFloat($("#product_quantity").val()) * parseFloat(unit))
			$("#product_quantity").focus()
		else
			$("#product_quantity").val("")

jQuery ->
	$(".to_pay").click ->
		$("#pay_quotation_form").show()
		$("#money_expected").val($("#total_to_pay").text())
		$("#money_expected").attr("readonly", "true")
		$("#money_returned").attr("readonly", "true")

jQuery ->
	$("#money_received").keyup ->
		$("#money_returned").val(parseFloat($(this).val()) - parseFloat($("#money_expected").val()))

jQuery ->
	$(".change_user_item").click ->
		$("#quotation_user_id").val($(this).parent().attr("id")) 
		$("#user_to_auth").val($(this).parent().attr("id"))
		$("#who_register h1").html("Registrado por: "+ $(this).text())
		$("#inside_auth_user_form").html("Registrado por: "+ $(this).text())

jQuery ->
	$("#quotation_title div h2").click ->
		$("#authenticate_user").show()
		$("#small_code").focus()

totalStock = ->
	value = 0
	$("#down table tbody tr").each ->
		value = value + parseInt($(this).find("td:last-child").text())
	value

jQuery ->
	$(".small_part input[type=checkbox]").live "click", ->
		$(this).val(1)
		$(this).parents("tr").hide()
		add_prices_to_form()

jQuery ->
	$("#money_part").click ->
		add_prices()		

dollar_regexp = /d[a-z]*s/i
soles_regexp = /n[a-z]*s/i

soles_value = 0
dollars_value = 0
coin_agnostic_value = 0
total = 0

add_prices_to_form = () ->
	my_form_body = ""
	count = 0
	$(".qd:visible").each ->
		count = count + 1
		money_type = $(this).find(".money_type_goes_here input[type=hidden]").val()
		value = $(this).find(".total_goes_here input[type=text]").val()
		my_form_body = my_form_body + "<input id=\"money_type_"+count+"\" name=\"money_type_"+count+"\" type=\"hidden\" value=\""+money_type+"\"></input><input type=\"hidden\" id=\"value_"+count+"\" name=\"value_"+count+"\" value=\""+value+"\"></input>"
	first_part = "<input id=\"number_to_iterate\" type=\"hidden\" value=\""+count+"\" name=\"number_to_iterate\"></input>"
	submit_part = "<input type=\"submit\" value=\"consultar precio\"></input>"
	$("#check_prices").html(first_part+my_form_body+submit_part)
	$("#check_prices").submit()