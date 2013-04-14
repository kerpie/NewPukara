class AddAttributesToSuppliers < ActiveRecord::Migration
  def change
  	add_column :suppliers, :mail, :string
  	add_column :suppliers, :other, :string
  end
end
