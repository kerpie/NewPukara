class AddDiscountToPriceType < ActiveRecord::Migration
  def change
  	add_column :price_types, :discount, :float
  end
end
