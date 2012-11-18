class ParentModel < ActiveRecord::Base
  attr_accessible :name

  has_many :model_types
  has_many :models, :through => :model_types
end
