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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140802013333) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: true do |t|
    t.string  "title",          null: false
    t.integer "band_id",        null: false
    t.string  "recording_type", null: false
  end

  add_index "albums", ["title", "band_id"], name: "index_albums_on_title_and_band_id", unique: true, using: :btree

  create_table "bands", force: true do |t|
    t.string "name", null: false
  end

  add_index "bands", ["name"], name: "index_bands_on_name", unique: true, using: :btree

  create_table "notes", force: true do |t|
    t.integer  "user_id"
    t.integer  "track_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["user_id", "track_id"], name: "index_notes_on_user_id_and_track_id", unique: true, using: :btree

  create_table "tracks", force: true do |t|
    t.integer "album_id",     null: false
    t.string  "title",        null: false
    t.integer "track_number", null: false
    t.string  "track_type",   null: false
    t.text    "lyrics"
  end

  add_index "tracks", ["title", "album_id"], name: "index_tracks_on_title_and_album_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                           null: false
    t.string   "password_digest",                 null: false
    t.string   "session_token",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "activated",       default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", using: :btree

end
