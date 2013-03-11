module ApplicationHelper

	def link_to_add_field(name, f, association)
		new_object = f.object.class.reflect_on_association(association).klass.new
		fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
			render(association.to_s + "_field", :data => builder)
		end
		link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
	end

	def datalist_text_field_tag(name, input_value, list_name, collection)
		field_tag = text_field_tag(name, input_value, :list => list_name)
		datalist_part = "<datalist id=\"#{list_name}\">"
		datalist_part_middle = ""
		collection.each do |c|
			datalist_part_middle = datalist_part_middle + "<option value=\"#{c.name}\">#{c.name}</option>"
		end
		datalist_part_final = "</datalist>"
		datalist_items = datalist_part + datalist_part_middle + datalist_part_final
		result = field_tag + datalist_items.html_safe
	end

	def second_datalist_text_field_tag(name, list_name, collection)
		field_tag = text_field_tag(name, nil, :list => list_name)
		datalist_part = "<datalist id=\"#{list_name}\">"
		datalist_part_middle = ""
		collection.each do |c|
			datalist_part_middle = datalist_part_middle + "<option value=\"#{c.model.name}\">#{c.model.name}</option>"
		end
		datalist_part_final = "</datalist>"
		datalist_items = datalist_part + datalist_part_middle + datalist_part_final
		result = field_tag + datalist_items.html_safe
	end

	def render_proper_navbar(user)
		result = ""
		user.roles.each do |role|
			result = result + render("page/"+role.name.downcase+"_navbar.html")
		end
		result
	end

	def image_url(product, size)
		if product.image?
			product.image.url(size)
		else
			"missing.jpg"
		end
	end

	def give_me_my_address(client)
		client.address
	end
end