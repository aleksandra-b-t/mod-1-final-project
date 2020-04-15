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

ActiveRecord::Schema.define(version: 2020_04_15_220552) do

  create_table "characters", force: :cascade do |t|
    t.integer "user_id"
    t.string "char_type"
    t.integer "starting_hp"
  end

  create_table "face_masks", force: :cascade do |t|
    t.string "name", default: "FACE MASK"
    t.integer "usage", default: 1
    t.integer "hp", default: 6
    t.integer "user_id"
  end

  create_table "lysols", force: :cascade do |t|
    t.string "name", default: "LYSOL"
    t.integer "user_id"
  end

  create_table "purells", force: :cascade do |t|
    t.string "name", default: "PURELL"
    t.integer "usage", default: 4
    t.integer "hp", default: 2
    t.integer "user_id"
  end

  create_table "rubber_gloves", force: :cascade do |t|
    t.string "name", default: "RUBBER GLOVES"
    t.integer "usage", default: 1
    t.integer "hp", default: 10
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "panic_cry"
    t.integer "hp"
    t.integer "turns"
    t.string "endgame", default: "lose"
    t.string "purell"
    t.string "face_mask"
    t.string "rubber_glove"
    t.boolean "lysol"
    t.string "important_person"
  end

end
