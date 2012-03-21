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

ActiveRecord::Schema.define(:version => 20120319150515) do

  create_table "conditions", :force => true do |t|
    t.integer  "level"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "invitations", :force => true do |t|
    t.boolean  "trial",      :default => false
    t.integer  "user_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "languages", :primary_key => "name", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "players", :force => true do |t|
    t.string   "player_name"
    t.integer  "game_player_id"
    t.integer  "world_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "last_score",     :limit => 8
    t.integer  "bank_level"
    t.integer  "score",          :limit => 8
  end

  create_table "scores", :force => true do |t|
    t.integer  "score",      :limit => 8
    t.integer  "place"
    t.integer  "player_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "scores", ["player_id", "created_at"], :name => "player_id_created_at"
  add_index "scores", ["player_id"], :name => "p_id"

  create_table "spies", :force => true do |t|
    t.integer  "player_id"
    t.integer  "user_id"
    t.integer  "bank_level"
    t.integer  "score_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",                        :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "register_invitation_id"
    t.integer  "credits"
    t.boolean  "premium"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"

  create_table "world_stats", :force => true do |t|
    t.integer  "world_id"
    t.integer  "level_summary"
    t.integer  "bank_count"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "worlds", :force => true do |t|
    t.string   "language_id"
    t.integer  "front"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "level_summary"
    t.integer  "bank_count"
  end

end
