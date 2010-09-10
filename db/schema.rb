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

ActiveRecord::Schema.define(:version => 20100910132042) do

  create_table "activities", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "bok_id"
    t.string   "action"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "boks", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "position"
    t.string   "type"
    t.string   "ancestry"
    t.string   "title"
    t.string   "description"
    t.string   "content_type"
    t.string   "properties"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boks", ["ancestry"], :name => "index_boks_on_ancestry"
  add_index "boks", ["title"], :name => "index_boks_on_title"
  add_index "boks", ["type"], :name => "index_boks_on_type"

  create_table "permissions", :force => true do |t|
    t.integer  "bok_id"
    t.integer  "user_id"
    t.string   "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "login"
    t.string   "rol",               :default => "user"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
