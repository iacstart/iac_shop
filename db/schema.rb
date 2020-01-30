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

ActiveRecord::Schema.define(version: 4) do

  create_table "app_devices", force: :cascade do |t|
    t.string "manufacturer"
    t.string "device_name"
    t.string "platform"
    t.string "serial"
    t.string "product_image"
    t.text "product_desc"
  end

  create_table "app_metrics", force: :cascade do |t|
    t.string "status"
    t.string "count"
    t.string "sum"
  end

  create_table "app_settings", force: :cascade do |t|
    t.string "status"
    t.string "version_number"
  end

end
