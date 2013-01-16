class OutputDocumentDetail < ActiveRecord::Base
  attr_accessible 	:output_folder_id, 
  					:product_id, 
  					:quantity, 
  					:sell_price,
  					:unit_id

  belongs_to :output_folder
  belongs_to :product
  belongs_to :unit

  has_many :output_codes
end