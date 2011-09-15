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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110914232052) do

  create_table "bikes", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "nickname"
    t.string   "frame"
    t.string   "fork"
    t.string   "handlebars"
    t.string   "stem"
    t.string   "headset"
    t.string   "saddle"
    t.string   "seat_post"
    t.string   "brakes"
    t.string   "brake_pads"
    t.string   "brake_levers"
    t.string   "brake_cables"
    t.string   "crank"
    t.string   "chainrings"
    t.string   "pedals"
    t.string   "bottom_bracket"
    t.string   "chain"
    t.string   "front_derailer"
    t.string   "rear_derailer"
    t.string   "derailer_cables"
    t.string   "shift_levers"
    t.string   "front_hub"
    t.string   "rear_hub"
    t.string   "rims"
    t.string   "spokes"
    t.string   "freewheel_cassette"
    t.string   "tires"
    t.string   "tubes"
    t.string   "fenders"
    t.string   "racks"
    t.string   "front_lights"
    t.string   "rear_lights"
    t.string   "bottle_cages"
    t.string   "luggage"
    t.string   "wheelbuilder"
    t.string   "misc"
    t.integer  "version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "notes", :force => true do |t|
    t.text     "note"
    t.integer  "bike_id"
    t.integer  "ride_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rides", :force => true do |t|
    t.float    "miles"
    t.float    "kilometers"
    t.string   "description"
    t.integer  "bike_id"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "long_description"
    t.integer  "user_id"
    t.boolean  "template"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
