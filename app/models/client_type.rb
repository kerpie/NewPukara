class ClientType < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => {:message => " no puede estar vacio"}

  has_many :clients
end
