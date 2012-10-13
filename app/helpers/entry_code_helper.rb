module EntryCodeHelper

	def text_field_with_value(name, code)
		new_code = EntryCode.find(code.id)
		if new_code.original_code.nil?
			value = ""
		else
			value = new_code.original_code
		end
		text_field_tag(name, value)
	end

end
