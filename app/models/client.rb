class Client < ActiveRecord::Base
  attr_accessible :identification_number, :address, :client_type_id, :name

  validates :identification_number, :uniqueness => :true

  belongs_to :client_type
  has_many :output_folders
  has_many :quotations
end
