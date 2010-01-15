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

ActiveRecord::Schema.define(:version => 20100114004035) do

  create_table "detalojs", :force => true do |t|
    t.integer  "mustelid_id"
    t.binary   "image"
    t.float    "condylobassal_length"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genus", :force => true do |t|
    t.integer  "subfamily_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keeper_locations", :force => true do |t|
    t.integer  "keeper_id"
    t.integer  "location_id"
    t.datetime "start_date"
    t.datetime "end_date"
  end

  create_table "keepers", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keepers_mustelids", :id => false, :force => true do |t|
    t.integer "keeper_id"
    t.integer "mustelid_id"
  end

  create_table "location_mustelids", :force => true do |t|
    t.integer  "mustelid_id"
    t.integer  "location_id"
    t.datetime "start_date"
    t.datetime "end_date"
  end

  create_table "locations", :force => true do |t|
    t.string   "country"
    t.string   "province"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "mustelids", :force => true do |t|
    t.integer  "species_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "species", :force => true do |t|
    t.integer  "genus_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subfamilies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "state",                                    :default => "passive"
    t.datetime "deleted_at"
    t.string   "password_reset_code",       :limit => 40
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
