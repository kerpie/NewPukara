class CreateEntryDocuments < ActiveRecord::Migration
  def change
    create_table :entry_documents do |t|
      t.string :numeration
      t.integer :document_type_id
      t.integer :entry_folder_id

      t.timestamps
    end
  end
end
