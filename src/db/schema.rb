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

ActiveRecord::Schema[7.0].define(version: 2022_11_12_120410) do
  create_table "likes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "roadmap_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["roadmap_id"], name: "index_likes_on_roadmap_id"
    t.index ["user_id", "roadmap_id"], name: "index_likes_on_user_id_and_roadmap_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "roadmap_tags", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "roadmap_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["roadmap_id"], name: "index_roadmap_tags_on_roadmap_id"
    t.index ["tag_id", "roadmap_id"], name: "index_roadmap_tags_on_tag_id_and_roadmap_id", unique: true
    t.index ["tag_id"], name: "index_roadmap_tags_on_tag_id"
  end

  create_table "roadmaps", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title", null: false
    t.text "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "start_skill"
    t.text "end_skill"
    t.boolean "is_published", default: false, null: false
    t.index ["user_id"], name: "index_roadmaps_on_user_id"
  end

  create_table "steps", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "roadmap_id", null: false
    t.text "url"
    t.string "title", null: false
    t.text "introduction"
    t.string "required_time"
    t.string "year"
    t.string "month"
    t.integer "step_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["roadmap_id"], name: "index_steps_on_roadmap_id"
  end

  create_table "tags", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "sub", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "github_account"
    t.string "twitter_account"
    t.string "avatar", null: false
  end

  add_foreign_key "likes", "roadmaps"
  add_foreign_key "likes", "users"
  add_foreign_key "roadmap_tags", "roadmaps"
  add_foreign_key "roadmap_tags", "tags"
  add_foreign_key "roadmaps", "users"
  add_foreign_key "steps", "roadmaps"
end
