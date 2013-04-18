jQuery ->
	$(".clickable_space").live "click", -> 
		$("#product_search_for_entry_folder").show()
		id = $(this).prev().attr('id').substring(4)
		$(".new_id").attr('id', "new_")
		tmp_id = $(".new_id").attr('id') + id
		$(".new_id").attr('id', tmp_id)

jQuery ->
	$(".product_search_item").live "click", ->
		id = $(".new_id").attr('id').substring(4)
		$("#kid_"+id).val($(this).find("p").html())
		$("#kid_"+id).parent().prev().val($(this).find(".hidden_data").val())
		$(".new_id").attr('id', "new_")
		$(this).parents(".floating_part").hide()

jQuery ->
	$(".nested_doc_field input[type=text]").live "keyup", ->
		value = $(this).val()
		regexp = /\s+/g
		new_regexp = /[a-z]*[A-Z]*/g
		value = value.replace(regexp,"")
		value = value.replace(new_regexp,"")	
		$(this).val(value)

jQuery ->
	$("#sup_id").click ->
		$("#change_supplier_link").click()

jQuery ->
	$(".nested_doc_field input[type=checkbox]").live "click", ->
		comment = "	VALOR 0 -> ALMACENA EL VALOR
				 	VALOR 1 -> NO ALMACENA EL VALOR "
		$(this).val("1")
		$(this).parents(".et_doc_item").hide()

jQuery ->
	$(".nested_doc_detail_field input[type=checkbox]").live "click", ->
		$(this).val("1")
		$(this).parents(".et_doc_detail_item").hide()