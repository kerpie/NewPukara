class Quotation < ActiveRecord::Base
  attr_accessible 	:client_id, 
  					:code, 
  					:date, 
  					:user_id,
  					:quotation_details_attributes

  has_many :quotation_details, :dependent => :destroy
  belongs_to :client
  belongs_to :user
end
