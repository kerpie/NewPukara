class Client < ActiveRecord::Base
  attr_accessible 	:identification_number, 
  					:address, 
  					:client_type_id, 
  					:name,
  					:phone,
					:mobile,
					:reference,
					:mail,
					:contact_person

  validates :identification_number, :uniqueness => :true
  validates :name, :presence => :true
  validate :phone, :presence => :true
  validate :mail, :presence => :true

  belongs_to :client_type
  has_many :output_folders
  has_many :quotations
end
