class AddUnitToDocumentDetail < ActiveRecord::Migration
  def change
  	add_column :entry_document_details, :unit_id, :integer
  end
end
