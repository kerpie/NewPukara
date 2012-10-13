class CreateOutputDocumentDetails < ActiveRecord::Migration
  def change
    create_table :output_document_details do |t|
      t.integer :product_id
      t.float :sell_price
      t.integer :quantity
      t.integer :output_folder_id

      t.timestamps
    end
  end
end
