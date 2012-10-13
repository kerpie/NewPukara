class CreateEntryFolders < ActiveRecord::Migration
  def change
    create_table :entry_folders do |t|
      t.integer :supplier_id
      t.integer :user_id
      t.integer :folder_state_id
      t.date :date

      t.timestamps
    end
  end
end
