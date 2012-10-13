class EntryDocumentDetail < ActiveRecord::Base
  attr_accessible 	:entry_folder_id, 
  					:product_id, 
  					:purchase_price, 
  					:quantity

  belongs_to :entry_folder
  belongs_to :product

  has_many :entry_codes, :dependent => :delete_all
  has_many :sell_prices, :dependent => :delete_all
end
