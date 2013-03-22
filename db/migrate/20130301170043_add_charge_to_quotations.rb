class AddChargeToQuotations < ActiveRecord::Migration
	def up
		add_column :quotations, :money_received, :float
		add_column :quotations, :money_returned, :float
		add_column :quotations, :money_expected, :float
    	add_column :quotations, :money_type_id, :integer
  	end
  	def down
  		remove_column :quotations, :money_type_id
  		remove_column :quotations, :money_expected
  		remove_column :quotations, :money_received
		remove_column :quotations, :money_returned
  	end
end 