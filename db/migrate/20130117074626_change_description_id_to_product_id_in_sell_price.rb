class ChangeDescriptionIdToProductIdInSellPrice < ActiveRecord::Migration
  def change
  	rename_column :sell_prices, :entry_document_detail_id, :product_id
  end
end