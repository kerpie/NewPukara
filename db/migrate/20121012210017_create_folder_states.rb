class CreateFolderStates < ActiveRecord::Migration
  def change
    create_table :folder_states do |t|
      t.string :name

      t.timestamps
    end
  end
end
