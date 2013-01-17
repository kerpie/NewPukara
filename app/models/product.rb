class Product < ActiveRecord::Base
  attr_accessible :description, :model_id, :monthly_price, :monthly_quantity, :product_type_id, :image

  validates :description, :presence => {:message => " no puede estar vacio"}
  
  validates :model_id, :presence => {:message => " no puede estar vacio"}
  validates :model_id, :uniqueness => {:message => " ya ha sido tomado"}

  validates :product_type_id, :presence => {:message => " no puede estar vacio"}
  
  validates :monthly_price, :presence => {:message => " no puede estar vacio"}
  validates :monthly_quantity, :presence => {:message => " no puede estar vacio"}

  belongs_to :model
  belongs_to :product_type

  has_many :entry_document_details, :dependent => :destroy
  has_many :output_document_details, :dependent => :destroy
  has_many :stock
  has_many :sell_prices, :dependent => :delete_all

  has_attached_file :image, :styles => {
    :medium => "200x200>",
    :large => "400x400>"
  }, 
  :path => ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
  :url => "/system/:class/:attachment/:id/:style/:filename", :dependent => :destroy
  
  def full_name
  	product_type.name.capitalize + " " + model.brand.name + " " + model.model_type.parent_model.name + " " + model.model_type.name + " " + model.name 
  end
end
