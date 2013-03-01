class Client < ActiveRecord::Base
  attr_accessible :DNI, :RUC, :address, :client_type_id, :name

  belongs_to :client_type
  has_many :output_folders
  has_many :quotations
end
