class ModelType < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => {:message => " no puede estar vacio"}
end
