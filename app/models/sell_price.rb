class SellPrice < ActiveRecord::Base
  attr_accessible :product_id, :price_type_id, :sell_price

  belongs_to :product_id
  belongs_to :price_type
end
