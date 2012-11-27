class ParentModel < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => {:message => " no puede estar vacio"}
  validates :name, :uniqueness => true
  
  has_many :model_types
  has_many :models, :through => :model_types
end
