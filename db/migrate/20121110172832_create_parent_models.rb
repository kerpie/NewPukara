class CreateParentModels < ActiveRecord::Migration
  def change
    create_table :parent_models do |t|
      t.string :name

      t.timestamps
    end
  end
end
