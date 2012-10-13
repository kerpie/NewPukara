class CreateOutputCodes < ActiveRecord::Migration
  def change
    create_table :output_codes do |t|
      t.integer :output_document_detail_id
      t.integer :registered_code

      t.timestamps
    end
  end
end
