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
  has_many :quotation_details, :dependent => :destroy
  has_many :stock
  has_many :sell_prices, :dependent => :delete_all

  has_attached_file :image, :styles => {
    :medium => "200x200>",
    :large => "400x400>"
  }, 
  :path => ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
  :url => "/system/:class/:attachment/:id/:style/:filename", :dependent => :destroy
  
  def full_name
    regexp  = "CLASIFIC"
    pt_name = ""
    brand_name = ""
    pm_name = ""
    mt_name = ""
    model_name   = ""

    unless product_type.name.upcase.match(regexp)
      pt_name = product_type.name.upcase
    end

    unless model.brand.name.upcase.match(regexp)
      brand_name = model.brand.name.upcase
    end

    unless model.model_type.parent_model.name.upcase.match(regexp)
      pm_name = model.model_type.parent_model.name.upcase
    end

    unless model.model_type.name.upcase.match(regexp)
      mt_name = model.model_type.name.upcase
    end

    unless model.name.match(regexp)
      model_name = model.name.upcase
    end

    pt_name + " " + brand_name + " " + pm_name + " " + mt_name + " " + model_name
  end
end
