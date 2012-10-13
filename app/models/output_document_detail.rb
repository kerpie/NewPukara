class OutputDocumentDetail < ActiveRecord::Base
  attr_accessible 	:output_folder_id, 
  					:product_id, 
  					:quantity, 
  					:sell_price

  belongs_to :output_folder
  belongs_to :product

  has_many :output_codes
end