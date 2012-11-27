class ModelType < ActiveRecord::Base
  attr_accessible :name, :parent_model_id
  
  validates :name, :presence => {:message => " no puede estar vacio"}
  validates :name, :uniqueness => true

  has_many :models
  belongs_to :parent_model
end
