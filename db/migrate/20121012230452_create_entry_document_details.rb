class CreateEntryDocumentDetails < ActiveRecord::Migration
  def change
    create_table :entry_document_details do |t|
      t.integer :entry_folder_id
      t.integer :product_id
      t.integer :quantity
      t.float :purchase_price

      t.timestamps
    end
  end
end
