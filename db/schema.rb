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

ActiveRecord::Schema[8.0].define(version: 2025_06_30_092431) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "square_map_tiles", force: :cascade do |t|
    t.integer "x_pos"
    t.integer "y_pos"
    t.integer "tile_type", default: 0
    t.integer "layer", default: 0
    t.bigint "square_map_id", null: false
    t.bigint "square_tile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["square_map_id"], name: "index_square_map_tiles_on_square_map_id"
    t.index ["square_tile_id"], name: "index_square_map_tiles_on_square_tile_id"
  end

  create_table "square_maps", force: :cascade do |t|
    t.text "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_square_maps_on_user_id"
  end

  create_table "square_tiles", force: :cascade do |t|
    t.text "map", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "square_map_tiles", "square_maps"
  add_foreign_key "square_map_tiles", "square_tiles"
  add_foreign_key "square_maps", "users"
end
