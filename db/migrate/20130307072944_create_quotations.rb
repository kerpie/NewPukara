class CreateQuotations < ActiveRecord::Migration
  def change
    create_table :quotations do |t|
      t.integer :user_id
      t.integer :client_id
      t.date :date
      t.string :code
      t.float :money_received
      t.float :money_returned
      t.float :money_expected
      t.integer :money_type_id

      t.timestamps
    end
  end
end
