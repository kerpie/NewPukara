class AddChargeToQuotations < ActiveRecord::Migration
  def change
  	add_column :quotations, :money_received, :float
  	add_column :quotations, :money_returned, :float
  	add_column :quotations, :money_expected, :float
  	add_column :quotations, :money_type_id, :integer
  end
end
