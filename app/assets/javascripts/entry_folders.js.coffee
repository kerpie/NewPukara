jQuery -> 
	$(".ef_dd_product_name").live 'click', ->
		$("#product_search_for_entry_folder").show()
		id = $(this).attr('id')
		$(".new_id").attr('id', "new_")
		tmp_id = $(".new_id").attr('id') + id
		$(".new_id").attr('id', tmp_id)

jQuery ->
	$(".product_search_item").live "click", ->
		id = $(".new_id").attr('id').substring(4)
		$("#"+id).val($(this).find("p").html())
		$(this).parents(".floating_part").hide()