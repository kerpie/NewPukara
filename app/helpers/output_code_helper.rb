module OutputCodeHelper
	def ouput_text_field_with_value(name,code)
		new_code = OutputCode.find(code.id)
		if new_code.nil?
			value = ""
		else
			value = new_code.registered_code
		end
		text_field_tag(name, value)
	end
end
