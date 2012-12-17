class Model < ActiveRecord::Base
  attr_accessible :brand_id, :model_type_id, :name

  validates :brand_id, :presence => {:message => " no puede estar vacio"}
  validates :model_type_id, :presence => {:message => " no puede estar vacio"}
  validates :name, :presence => {:message => " no puede estar vacio"}

  belongs_to :brand
  belongs_to :model_type
  has_one :product, :dependent => :destroy
end
