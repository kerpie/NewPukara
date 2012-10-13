class CreateOutputDocuments < ActiveRecord::Migration
  def change
    create_table :output_documents do |t|
      t.string :numeration
      t.integer :document_type_id
      t.integer :output_folder_id

      t.timestamps
    end
  end
end
