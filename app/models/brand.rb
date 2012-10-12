class Brand < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => {:message => " no puede estar vacio"}
  validates :name, :uniqueness => true

  has_many :models
end
