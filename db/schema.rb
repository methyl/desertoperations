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

ActiveRecord::Schema.define(:version => 20120201104559) do

  create_table "conditions", :force => true do |t|
    t.integer  "level"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "players", :force => true do |t|
    t.string   "player_name"
    t.integer  "game_player_id"
    t.integer  "world_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "last_score"
    t.integer  "bank_level"
    t.integer  "score"
  end

  create_table "scores", :force => true do |t|
    t.integer  "score",      :limit => 8
    t.integer  "place"
    t.integer  "player_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "worlds", :force => true do |t|
    t.string   "lang"
    t.integer  "front"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
