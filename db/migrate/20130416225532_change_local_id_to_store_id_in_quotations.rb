class ChangeLocalIdToStoreIdInQuotations < ActiveRecord::Migration
  def up
  	rename_column :notifications, :local_id, :store_id
  end

  def down
  end
end
