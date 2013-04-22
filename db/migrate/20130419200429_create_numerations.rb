class CreateNumerations < ActiveRecord::Migration
  def change
    create_table :numerations do |t|
      t.integer :store_id
      t.integer :document_type_id
      t.integer :current_number
      t.integer :initial_number

      t.timestamps
    end
  end
end
