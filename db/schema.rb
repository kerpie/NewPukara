# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130416225532) do

  create_table "brands", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "client_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "identification_type"
    t.integer  "identification_quantity"
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "client_type_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "identification_number"
    t.string   "phone"
    t.string   "mobile"
    t.string   "reference"
    t.string   "mail"
    t.string   "contact_person"
  end

  create_table "document_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "entry_codes", :force => true do |t|
    t.integer  "entry_document_detail_id"
    t.string   "original_code"
    t.string   "generated_code"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "entry_document_details", :force => true do |t|
    t.integer  "entry_folder_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.float    "purchase_price"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "unit_id"
    t.integer  "money_type_id"
  end

  create_table "entry_documents", :force => true do |t|
    t.string   "numeration"
    t.integer  "document_type_id"
    t.integer  "entry_folder_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "entry_folders", :force => true do |t|
    t.integer  "supplier_id"
    t.integer  "user_id"
    t.integer  "folder_state_id"
    t.date     "date"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "folder_states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "model_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "parent_model_id"
  end

  create_table "models", :force => true do |t|
    t.string   "name"
    t.integer  "brand_id"
    t.integer  "model_type_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "money_types", :force => true do |t|
    t.string   "name"
    t.float    "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "notifications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "store_id"
    t.string   "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "output_codes", :force => true do |t|
    t.integer  "output_document_detail_id"
    t.integer  "registered_code"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "output_document_details", :force => true do |t|
    t.integer  "product_id"
    t.float    "sell_price"
    t.integer  "quantity"
    t.integer  "output_folder_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "unit_id"
  end

  create_table "output_documents", :force => true do |t|
    t.string   "numeration"
    t.integer  "document_type_id"
    t.integer  "output_folder_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "output_folders", :force => true do |t|
    t.integer  "client_id"
    t.integer  "folder_state_id"
    t.integer  "user_id"
    t.date     "date"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "quotation_id"
  end

  create_table "parent_models", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "price_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.float    "discount"
  end

  create_table "product_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.integer  "model_id"
    t.integer  "product_type_id"
    t.text     "description"
    t.integer  "monthly_quantity"
    t.float    "monthly_price"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "quotation_details", :force => true do |t|
    t.integer  "quotation_id"
    t.integer  "product_id"
    t.integer  "unit_id"
    t.integer  "quantity"
    t.float    "sell_price"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "quotations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.date     "date"
    t.string   "code"
    t.float    "money_received"
    t.float    "money_returned"
    t.float    "money_expected"
    t.integer  "money_type_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.boolean  "payment_status"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "sell_prices", :force => true do |t|
    t.float    "sell_price"
    t.integer  "product_id"
    t.integer  "price_type_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "money_type_id"
  end

  create_table "stocks", :force => true do |t|
    t.integer  "quantity"
    t.integer  "product_id"
    t.integer  "store_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stores", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "contact_person"
    t.string   "phone"
    t.string   "country"
    t.string   "city"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "mail"
    t.string   "other"
  end

  create_table "units", :force => true do |t|
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => ""
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "username"
    t.string   "dni"
    t.string   "address"
    t.string   "relative_phone"
    t.string   "name"
    t.string   "last_name"
    t.float    "salary"
    t.integer  "small_code"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "store_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
