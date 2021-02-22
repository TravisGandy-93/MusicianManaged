# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_22_035447) do

  create_table "albums", force: :cascade do |t|
    t.binary "artwork"
    t.string "name"
    t.date "release_date"
    t.integer "musician_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["musician_id"], name: "index_albums_on_musician_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.integer "album_id", null: false
    t.integer "song_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["album_id"], name: "index_genres_on_album_id"
    t.index ["song_id"], name: "index_genres_on_song_id"
  end

  create_table "musicians", force: :cascade do |t|
    t.string "name"
    t.string "instrument"
    t.integer "members"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.integer "length"
    t.integer "user_id", null: false
    t.integer "album_id", null: false
    t.integer "musician_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["album_id"], name: "index_songs_on_album_id"
    t.index ["musician_id"], name: "index_songs_on_musician_id"
    t.index ["user_id"], name: "index_songs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "albums", "musicians"
  add_foreign_key "genres", "albums"
  add_foreign_key "genres", "songs"
  add_foreign_key "songs", "albums"
  add_foreign_key "songs", "musicians"
  add_foreign_key "songs", "users"
end
