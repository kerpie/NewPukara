class CreateQuotationDetails < ActiveRecord::Migration
  def change
    create_table :quotation_details do |t|
      t.integer :quotation_id
      t.integer :product_id
      t.integer :quantity
      t.float :sell_price
      t.integer :unit_id

      t.timestamps
    end
  end
end
