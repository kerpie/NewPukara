class CreateOutputFolders < ActiveRecord::Migration
  def change
    create_table :output_folders do |t|
      t.integer :client_id
      t.integer :folder_state_id
      t.integer :user_id
      t.date :date

      t.timestamps
    end
  end
end
