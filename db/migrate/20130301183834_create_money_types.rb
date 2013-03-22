class CreateMoneyTypes < ActiveRecord::Migration
	def change
	    create_table :money_types do |t|
			t.string :name
      		t.float :value
			t.timestamps
    	end
  	end
end 