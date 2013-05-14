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

ActiveRecord::Schema.define(:version => 20130514033212) do

  create_table "emergency_contacts", :force => true do |t|
    t.integer  "user_id"
    t.string   "full_name"
    t.integer  "phone_number"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "emergency_contacts", ["user_id"], :name => "index_emergency_contacts_on_user_id"

  create_table "texts", :force => true do |t|
    t.string "phone_number"
  end

  create_table "treks", :force => true do |t|
    t.integer  "trip_id"
    t.datetime "started_at"
    t.datetime "expected_end_at"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "over",            :default => false
    t.integer  "count",           :default => 0
  end

  add_index "treks", ["trip_id"], :name => "index_treks_on_trip_id"

  create_table "trips", :force => true do |t|
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "user_id"
    t.string   "name"
    t.integer  "default_duration"
  end

  create_table "users", :force => true do |t|
    t.string   "full_name",        :null => false
    t.integer  "phone_number",     :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
