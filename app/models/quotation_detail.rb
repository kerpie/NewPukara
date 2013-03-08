class QuotationDetail < ActiveRecord::Base
  	attr_accessible	:product_id, 
  					:quantity, 
  					:quotation_id, 
  					:sell_price, 
  					:unit_id

  	belongs_to :product
  	belongs_to :quotation
  	belongs_to :unit 
end
