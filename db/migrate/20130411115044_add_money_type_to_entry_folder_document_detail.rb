class AddMoneyTypeToEntryFolderDocumentDetail < ActiveRecord::Migration
  def up
  	add_column :entry_document_details, :money_type_id, :integer
  end

  def down
  	remove_column :entry_document_details, :money_type_id
  end
end
