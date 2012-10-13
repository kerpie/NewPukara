class CreateSellPrices < ActiveRecord::Migration
  def change
    create_table :sell_prices do |t|
      t.float :sell_price
      t.integer :entry_document_detail_id
      t.integer :price_type_id

      t.timestamps
    end
  end
end
