class CreateMoneyTypes < ActiveRecord::Migration
	def up
	    create_table :money_types do |t|
			t.string :name
      		t.float :value
			t.timestamps
    	end
  	end
  	def down
  		drop_table :money_types
  	end
end 