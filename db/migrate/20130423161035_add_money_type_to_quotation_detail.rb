class AddMoneyTypeToQuotationDetail < ActiveRecord::Migration
  def change
  	add_column :quotation_details, :money_type_id, :integer
  	remove_column :quotations, :money_type_id
  	remove_column :quotations, :money_received
  	remove_column :quotations, :money_returned
  	remove_column :quotations, :money_expected
  end
end