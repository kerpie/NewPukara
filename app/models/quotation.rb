class Quotation < ActiveRecord::Base
  	attr_accessible	:client_id, 
  					:user_id,
  					:code, 
  					:date, 
  					:money_expected, 
  					:money_received, 
  					:money_returned, 
  					:money_type_id, 
            :quotation_details_attributes

  has_many :quotation_details             
	belongs_to :user
	belongs_to :money_type
	belongs_to :client

  accepts_nested_attributes_for :quotation_details
end