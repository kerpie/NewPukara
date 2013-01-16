class AddUnitToOutputDocumentDetail < ActiveRecord::Migration
  def change
  	add_column :output_document_details, :unit_id, :integer
  end
end
