class CreateQuotations < ActiveRecord::Migration
	def change
		create_table :quotations do |t|
    		t.integer :user_id
     		t.integer :client_id
      		t.date :date
      		t.string :code
			t.timestamps
    	end
  	end
end 