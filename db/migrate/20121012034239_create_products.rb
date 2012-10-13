class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :model_id
      t.integer :product_type_id
      t.text :description
      t.integer :monthly_quantity
      t.float :monthly_price

      t.timestamps
    end
  end
end
