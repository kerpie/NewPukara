class EntryDocumentDetail < ActiveRecord::Base
  attr_accessible 	:entry_folder_id, 
          					:product_id, 
                    :money_type_id,
          					:purchase_price, 
          					:unit_id,
          					:quantity

  validates :product_id, :presence => {:message => " no puede estar vacio"}

  belongs_to :entry_folder
  belongs_to :product
  belongs_to :unit
  belongs_to :money_type

  has_many :entry_codes, :dependent => :delete_all
  
end