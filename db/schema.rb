# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140904210245) do

  create_table "voters", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "voters"
    t.string   "street"
    t.string   "apt"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "precinct_id"
    t.integer  "voting_location_id"
    t.string   "precinct_id_shortened"
  end

  add_index "voters", ["precinct_id"], name: "index_voters_on_precinct_id"
  add_index "voters", ["precinct_id_shortened"], name: "index_voters_on_precinct_id_shortened"
  add_index "voters", ["voting_location_id"], name: "index_voters_on_voting_location_id"

  create_table "voting_locations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "precinct"
    t.string   "street"
    t.string   "city"
    t.string   "state_zip"
    t.string   "country"
    t.string   "precinct_shortened"
  end

  add_index "voting_locations", ["precinct"], name: "index_voting_locations_on_precinct"
  add_index "voting_locations", ["precinct_shortened"], name: "index_voting_locations_on_precinct_shortened"

end
