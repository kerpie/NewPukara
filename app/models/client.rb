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
  validates :name, :presence => {:message => " no puede estar blanco"}
  validate :phone, :presence => {:message => " no puede estar blanco"}
  validate :mail, :presence => {:message => " no puede estar blanco"}

  belongs_to :client_type
  has_many :output_folders
  has_many :quotations

  def search_text
    name.upcase + " " + identification_number.to_s
  end
end