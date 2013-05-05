class CreateTemporalNumerations < ActiveRecord::Migration
  def change
    create_table :temporal_numerations do |t|
      t.integer :quotation_detail_id
      t.string :temporal_code

      t.timestamps
    end
  end
end
