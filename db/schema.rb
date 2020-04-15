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

ActiveRecord::Schema.define(version: 2020_04_15_160010) do

  create_table "characters", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "char_type"
    t.integer "age"
    t.integer "hp"
    t.string "panic_cry"
    t.string "endgame", default: "lose"
    t.string "rubber_gloves"
    t.string "face_mask"
    t.integer "turns"
    t.string "purell"
    t.integer "purell_id"
    t.integer "rubber_gloves_id"
    t.integer "face_mask_id"
    t.boolean "lysol"
  end

  create_table "facemask", force: :cascade do |t|
    t.string "name", default: "FACE MASK"
    t.integer "usage", default: 1
    t.integer "hp", default: 6
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "hp"
    t.integer "usage"
  end

  create_table "lysol", force: :cascade do |t|
    t.string "name", default: "LYSOL"
  end

  create_table "purell", force: :cascade do |t|
    t.string "name", default: "PURELL"
    t.integer "usage", default: 4
    t.integer "hp", default: 2
  end

  create_table "rubbergloves", force: :cascade do |t|
    t.string "name", default: "RUBBER GLOVES"
    t.integer "usage", default: 1
    t.integer "hp", default: 10
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "panic_cry"
  end

end
