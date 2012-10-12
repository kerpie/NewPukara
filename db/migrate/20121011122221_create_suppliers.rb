class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :address
      t.string :contact_person
      t.string :phone
      t.string :country
      t.string :city

      t.timestamps
    end
  end
end
