class AddNewAttributesToClient < ActiveRecord::Migration
  def change
  	add_column :clients, :phone, :string
  	add_column :clients, :mobile, :string
  	add_column :clients, :reference, :string 
  	add_column :clients, :mail, :string 
  	add_column :clients, :contact_person, :string 
  end
end
