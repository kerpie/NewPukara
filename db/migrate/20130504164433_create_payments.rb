class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :money_type_id
      t.integer :quotation_id
      t.float :money_received
      t.float :money_returned
      t.timestamps
    end
  end
end
