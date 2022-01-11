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

ActiveRecord::Schema.define(version: 2022_01_11_001911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer "number"
    t.string "street"
    t.string "suburb"
    t.string "postcode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "parks", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "feature_id", null: false
    t.bigint "address_id", null: false
    t.string "icon"
    t.string "name"
    t.string "cheese"
    t.string "wine"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.bigint "user_id", null: false
    t.index ["address_id"], name: "index_parks_on_address_id"
    t.index ["category_id"], name: "index_parks_on_category_id"
    t.index ["feature_id"], name: "index_parks_on_feature_id"
    t.index ["user_id"], name: "index_parks_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "comment"
    t.integer "rating"
    t.bigint "park_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["park_id"], name: "index_posts_on_park_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
  end

  add_foreign_key "parks", "addresses"
  add_foreign_key "parks", "categories"
  add_foreign_key "parks", "features"
  add_foreign_key "parks", "users"
  add_foreign_key "posts", "parks"
  add_foreign_key "posts", "users"
end
