class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.integer :quantity
      t.integer :product_id
      t.integer :store_id

      t.timestamps
    end
  end
end
