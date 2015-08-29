# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150829133647) do

  create_table "catalogs", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "vendor_id"
    t.integer  "price",               :limit => 10, :precision => 10, :scale => 0
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_category_id"
  end

  create_table "contributions", :force => true do |t|
    t.integer  "guest_id"
    t.string   "message"
    t.integer  "amount",     :limit => 10, :precision => 10, :scale => 0
    t.integer  "site_id"
    t.integer  "catalog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guests", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "contact"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.string   "shipping_address"
    t.integer  "price"
    t.integer  "guest_id"
    t.integer  "cat_id"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_category", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "site_catalogs", :force => true do |t|
    t.integer  "cat_id"
    t.integer  "site_id"
    t.boolean  "purchased"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.string   "shipping_address"
    t.string   "owner_name"
    t.string   "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendors", :force => true do |t|
    t.string   "name"
    t.integer  "contact"
    t.string   "address"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
