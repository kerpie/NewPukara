class ModificationOfClientData < ActiveRecord::Migration
  def up
  	add_column :clients, :identification_number, :string
  	remove_column :clients, :DNI
  	remove_column :clients, :RUC

  	add_column :client_types, :identification_type, :string
  	add_column :client_types, :identification_quantity, :integer
  end

  def down
  	remove_column :clients, :identification_number
  	add_column :clients, :DNI, :string
  	add_column :clients, :RUC, :string

  	remove_column :client_types, :identification_type
  	remove_column :client_types, :identification_quantity
  end
end
