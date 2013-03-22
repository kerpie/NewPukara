class AddQuotationIdToOutputFolder < ActiveRecord::Migration
  def change
  	add_column :output_folders, :quotation_id, :integer
  end
end
