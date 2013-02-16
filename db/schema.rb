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

ActiveRecord::Schema.define(:version => 20130216155718) do

  create_table "item_orders", :force => true do |t|
    t.integer  "item_id"
    t.integer  "order_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.float    "price"
    t.string   "name"
    t.string   "country"
    t.string   "city"
    t.string   "category"
    t.boolean  "is_available"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.datetime "pickup_time"
    t.float    "total_price"
    t.text     "instructions"
    t.string   "status"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.string   "mobile"
    t.boolean  "is_vendor"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
