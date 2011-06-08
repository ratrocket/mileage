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

ActiveRecord::Schema.define(:version => 20110608231119) do

  create_table "bikes", :force => true do |t|
    t.string   "name"
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
    t.text     "notes"
    t.integer  "version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rides", :force => true do |t|
    t.float    "miles"
    t.float    "kilometers"
    t.text     "description"
    t.integer  "bike_id"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
