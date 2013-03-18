class AddPaymentStatusToQuotation < ActiveRecord::Migration
  def change
  	add_column :quotations, :payment_status, :boolean
  end
end
