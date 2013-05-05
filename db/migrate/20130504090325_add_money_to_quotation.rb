class AddMoneyToQuotation < ActiveRecord::Migration
  def change
  	add_column :quotations, :money_expected, :float
  	add_column :quotation_details, :money_value, :float
  end
end
