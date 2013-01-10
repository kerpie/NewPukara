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

		$(this).parents(".floating_part").hide()