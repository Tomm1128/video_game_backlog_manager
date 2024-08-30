# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_08_30_151327) do
  create_table "collection_video_games", force: :cascade do |t|
    t.integer "collection_id"
    t.integer "video_game_id"
    t.string "playtime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_collection_video_games_on_collection_id"
    t.index ["video_game_id"], name: "index_collection_video_games_on_video_game_id"
  end

  create_table "collections", force: :cascade do |t|
    t.integer "user_id"
    t.string "collection_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.decimal "rating"
    t.integer "user_id"
    t.integer "video_game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
    t.index ["video_game_id"], name: "index_reviews_on_video_game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "video_game_genres", force: :cascade do |t|
    t.integer "video_game_id"
    t.integer "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_video_game_genres_on_genre_id"
    t.index ["video_game_id"], name: "index_video_game_genres_on_video_game_id"
  end

  create_table "video_games", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "release_date"
    t.string "developer"
    t.string "publisher"
    t.string "platform"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
