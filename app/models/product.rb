class Product < ActiveRecord::Base
  attr_accessible :description, :model_id, :monthly_price, :monthly_quantity, :product_type_id

  validates :description, :presence => {:message => " no puede estar vacio"}
  validates :model_id, :presence => {:message => " no puede estar vacio"}, :uniqueness => true
  validates :product_type_id, :presence => {:message => " no puede estar vacio"}
  validates :monthly_price, :presence => {:message => " no puede estar vacio"}
  validates :monthly_quantity, :presence => {:message => " no puede estar vacio"}

  belongs_to :model
  belongs_to :product_type

  has_many :entry_document_details
  has_many :output_document_details
  
  def full_name
  	product_type.name + " " + model.model_type.parent_model.name + " " + model.model_type.name + " " + model.brand.name + " " + model.name
  end
end
