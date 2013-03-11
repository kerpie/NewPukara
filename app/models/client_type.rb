class ClientType < ActiveRecord::Base
  attr_accessible :name, :identification_type, :identification_quantity

  validates :name, :presence => {:message => " no puede estar vacio"}

  has_many :clients, :dependent => :destroy
end
