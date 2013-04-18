class AddMoneyTypeToSellPrice < ActiveRecord::Migration
  def change
  	add_column :sell_prices, :money_type_id, :integer
  end
end
