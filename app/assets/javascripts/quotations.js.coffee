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
				if quantity > parseInt($(".my_store").text())
					unit = $("#product_quantity").next("select").find("option:selected").attr("data-unit_value")
					$("#afp_down h2").text("Estas pidiendo "+quantity+" unidades y solo hay " + parseInt($(".my_store").text()) + " unidades en tu almacen")
					$("#ask_for_product").show()
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
		val = $(this).val()
		if event.which == 13
			discount = parseFloat($("#downer table tbody tr.here").attr("id"))
			price = parseFloat($("#downer table tbody tr.here td:last-child").html())
			if val < (price - price*discount)
				alert("El precio no puede ser menor al establecido con el descuento")
				$(this).val("")
			else
				$(this).parents(".q_box").hide()
				$("#"+id_row).find(".quantity_goes_here input").val($("#product_quantity").val()) 
				$("#"+id_row).find(".price_goes_here input").val($(this).val())
				$("#"+id_row).find(".price_goes_here input[type=hidden]").val(unit_id)
				$("#"+id_row).find(".total_goes_here input").val(parseFloat($(this).val())*parseFloat($("#product_quantity").val()))
				$("#"+id_row).find(".product_goes_here .tmp").val($("#qp_full_name").text())
				$("#"+id_row).find(".product_goes_here input[type=hidden]").val($("#this_is_the_product_id_you_shouldnt_be_seeing").val())
				$(this).val("")
				$("#product_quantity").val("")
				tmp_total = 0
				$(".total_goes_here").each ->
					tmp_total = tmp_total + parseFloat($(this).find('input').val())
				$("#quotation_total").html(tmp_total)
		if event.which == 27
			$(this).parents(".q_box").hide()
			
jQuery ->
	$("#product_unit").change ->
		unit_changed = true
		unit_id = $(this).val()
		unit = $(this).find("option:selected").attr("data-unit_value")
		$("#product_quantity").val(parseFloat($("#product_quantity").val()) * parseFloat(unit))
		$("#product_quantity").focus()

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