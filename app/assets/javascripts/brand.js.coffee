jQuery -> 
	$(".update_brand").hide()
	$(".destroy_brand").hide()
	$(".destroy_model").hide()
	$(".update_model").hide()

jQuery -> 
	$(".model_edit_image").click ->
 		li = $(this).parents("li")
 		id = li.attr("id")
 		p = li.find("p")
 		$("#model_edit").show()
 		$("#model_edit input[type=hidden]").attr('value', id)
 		$("#new_value").attr('value', p.html())

jQuery ->
	$(".parent_model_edit_image").live "click", ->
		li = $(this).parents(".just_here")
		tmpId = li.attr("id").substring(3)
		id = "pm_" + tmpId
		$("#"+id).show()

jQuery ->
	$(".model_type_edit_image").live "click", ->
		li = $(this).parents(".just_here")
		tmpId = li.attr("id").substring(6)
		id = "mt_" + tmpId
		$("#"+id).show()

jQuery -> 
	$("#search_brand").click ->
		if($(this).val() == "Buscar por marca")
			$(this).val("")

jQuery ->
	$("#search_brand").blur ->
		if $(this).val().length == 0
			$(this).val("Buscar por marca")

jQuery -> 
	$("#search_brand").keyup ->
		textToSearch = $(this).val().toUpperCase()
		$(".model_part").each ->
			if($(this).find(".br_name h1").text().search(new RegExp(textToSearch, "i"))< 0)
				$(this).hide()				
			else
				$(this).show()			