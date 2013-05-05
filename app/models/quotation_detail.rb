class QuotationDetail < ActiveRecord::Base
  	attr_accessible	:product_id, 
  					:quantity, 
  					:quotation_id, 
  					:sell_price, 
  					:unit_id,
  					:money_type_id,
            :money_value

  	belongs_to :product
  	belongs_to :quotation
  	belongs_to :unit 
  	belongs_to :money_type
    has_many :temporal_numerations,  :dependent => :destroy

    def full_description
      value = ""
      temporal_numerations.each do |tn|
        if tn == temporal_numerations.last
          value = value + tn.temporal_code
        else  
          value = value + tn.temporal_code + " - "
        end
      end
      product.full_name + " Series: " + value
    end
end