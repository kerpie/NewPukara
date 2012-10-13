class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :RUC
      t.string :DNI
      t.string :address
      t.integer :client_type_id

      t.timestamps
    end
  end
end
