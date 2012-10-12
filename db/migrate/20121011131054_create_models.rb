class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name
      t.integer :brand_id
      t.integer :model_type_id

      t.timestamps
    end
  end
end
