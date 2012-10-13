module SellPriceHelper
	def text_field_with_value(name, edd, pt)
		consulting_price = SellPrice.where(:entry_document_detail_id => edd, :price_type_id => pt).all
		if(consulting_price.count > 0)
			value = consulting_price.first.sell_price
		else
			value = ""
		end
		text_field_tag(name, value, :size => 10)
	end
end
