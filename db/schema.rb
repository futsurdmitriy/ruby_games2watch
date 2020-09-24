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

ActiveRecord::Schema.define(version: 2020_09_24_193625) do

  create_table "comments", force: :cascade do |t|
    t.string "text"
    t.integer "user_id", null: false
    t.integer "news_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["news_id"], name: "index_comments_on_news_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "game_modes", force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "mode_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_game_modes_on_game_id"
    t.index ["mode_id"], name: "index_game_modes_on_mode_id"
  end

  create_table "game_platforms", force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "platform_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_game_platforms_on_game_id"
    t.index ["platform_id"], name: "index_game_platforms_on_platform_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.integer "critics_rate"
    t.string "genre"
    t.string "company"
    t.string "publisher"
    t.integer "requirement_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["requirement_id"], name: "index_games_on_requirement_id"
  end

  create_table "modes", force: :cascade do |t|
    t.string "name"
    t.integer "maximum_players"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "news", force: :cascade do |t|
    t.text "text"
    t.string "headline"
    t.string "image"
    t.integer "author_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_news_on_author_id"
  end

  create_table "platforms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "requirements", force: :cascade do |t|
    t.string "type"
    t.string "operating_system"
    t.integer "ram"
    t.string "gpu"
    t.string "cpu"
    t.integer "free_space"
    t.integer "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_requirements_on_game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "comments", "news"
  add_foreign_key "comments", "users"
  add_foreign_key "game_modes", "games"
  add_foreign_key "game_modes", "modes"
  add_foreign_key "game_platforms", "games"
  add_foreign_key "game_platforms", "platforms"
  add_foreign_key "games", "requirements"
  add_foreign_key "news", "authors"
  add_foreign_key "requirements", "games"
end
