module QuotationsHelper

	def codes_field_with_value(qd)
		result = ""
		first_part = "<div class=\"fftc_product\">"
		last_part = "</div>"

		temporals = TemporalNumeration.where(:quotation_detail_id => qd.id).all
		if temporals.count > 0
			i = 0
			temporals.each do |tmp|
				result = result + first_part + text_field_tag("#{qd.id}_#{i}", tmp.temporal_code) + last_part
				i = i + 1
			end
			(qd.quantity - i).times do |k|
				result = result + first_part + text_field_tag("#{qd.id}_#{k+i}") + last_part
			end
		else
			qd.quantity.times do |i|
				result = result + first_part + text_field_tag("#{qd.id}_#{i}") + last_part
			end
		end

		result.html_safe
	end

=begin 
	def entry_text_field_with_value(name,code)
		new_code = EntryCode.find(code.id)
		if new_code.original_code.nil?
			value = ""
		else
			value = new_code.original_code
		end
		text_field_tag(name, value)
	end
=end 
end
