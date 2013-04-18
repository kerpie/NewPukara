class SellPrice < ActiveRecord::Base
  attr_accessible :product_id, :price_type_id, :sell_price, :money_type_id

  belongs_to :product
  belongs_to :price_type
  belongs_to :money_type
end
