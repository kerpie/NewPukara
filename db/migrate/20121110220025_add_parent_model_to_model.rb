class AddParentModelToModel < ActiveRecord::Migration
  def change
  	add_column :model_types, :parent_model_id, :integer
  end
end
