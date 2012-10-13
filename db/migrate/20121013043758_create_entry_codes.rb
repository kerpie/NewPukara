class CreateEntryCodes < ActiveRecord::Migration
  def change
    create_table :entry_codes do |t|
      t.integer :entry_document_detail_id
      t.string :original_code
      t.string :generated_code

      t.timestamps
    end
  end
end
