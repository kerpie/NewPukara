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
	$(".my_clickable_space").click ->
		