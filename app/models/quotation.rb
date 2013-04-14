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

  validates :client_id, :presence => {:message => " no puede estar vacio"}
  validates :user_id, :presence => {:message => " no puede estar vacio"}
  validates :date, :presence => {:message => " no puede estar vacio"}

  has_many :quotation_details
  has_one :output_folder             
  belongs_to :user
  belongs_to :money_type
  belongs_to :client

  accepts_nested_attributes_for :quotation_details
end
