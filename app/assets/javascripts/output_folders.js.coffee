typingTimer = null
doneTypingInterval = 1000

jQuery ->
	$(".clicker").click ->
		sentry = $(this).html()
		$('.clicker').each ->
			if $(this).hasClass('selected')
				$(this).removeClass('selected')
		$(this).addClass('selected')
		$('.classified_by_folder_state').each ->
			if sentry == $(this).attr('id')
				$(this).show()
			else
				$(this).hide()

jQuery ->
	$(".number").live 'keyup', ->
		max = parseInt($(this).prev().prev().val())
		if parseInt($(this).val()) > max 
			alert "El valor no puede ser mayor al maximo en stock"
			$(this).val("")


jQuery ->
	$(".my_clickable_space").live "click", ->
		$("#of_product_search").show();
		id = $(this).prev().attr('id').substring(4)
		$(".new_id").attr('id', "new_")
		tmp_id = $(".new_id").attr('id') + id
		$(".new_id").attr('id', tmp_id)

doneTyping = () ->
	alert "El precio de venta no puede ser menor al 10% del establecido"

jQuery ->
	$(".check_price").live 'keyup', ->
		max = parseFloat($(this).prev().val())
		clearTimeout(typingTimer)
		if(parseFloat($(this).val()) < (max - max*0.10))
			typingTimer = setTimeout(doneTyping, doneTypingInterval)

jQuery ->
	$(".of_clickable_item_list").live "click", ->
		name = $(this).parents(".of_product_item").find(".product_name").html()
		id = $(".new_id").attr('id').substring(4)
		destiny = "#mid_"+id
		$(destiny).val(name)
		$(destiny).parent().prev().val($(this).parents(".of_product_item").find(".product_id").val())

		$(destiny).parents(".nested_doc_detail_field").next().find(".sell_price").replaceWith($(this).parents(".store_data").next().html())

		stock_destiny = $(destiny).parents(".nested_doc_detail_field").next().next()
		$(stock_destiny).find(".max_quantity").html("Maximo: "+$(this).html()+" unidades")
		$(stock_destiny).find(".max_stock").val($(this).html())
		$(this).parents(".floating_part").hide()