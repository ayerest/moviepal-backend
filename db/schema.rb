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

ActiveRecord::Schema.define(version: 2019_09_27_215829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "genrepreferences", force: :cascade do |t|
    t.bigint "genre_id"
    t.bigint "preference_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_genrepreferences_on_genre_id"
    t.index ["preference_id"], name: "index_genrepreferences_on_preference_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.boolean "like"
    t.boolean "unlike"
    t.boolean "to_watch"
    t.bigint "movie_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_likes_on_movie_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "moviegenres", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_moviegenres_on_genre_id"
    t.index ["movie_id"], name: "index_moviegenres_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "rating"
    t.string "summary"
    t.integer "imdb_score"
    t.datetime "opening_date"
    t.string "poster_img"
    t.string "stars"
    t.string "trailer_url"
    t.string "showtimes_url"
    t.string "imdb_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "strength"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_preferences_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.string "city"
    t.string "password_digest"
    t.boolean "notifications"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "genrepreferences", "genres"
  add_foreign_key "genrepreferences", "preferences"
  add_foreign_key "likes", "movies"
  add_foreign_key "likes", "users"
  add_foreign_key "moviegenres", "genres"
  add_foreign_key "moviegenres", "movies"
  add_foreign_key "preferences", "users"
end
