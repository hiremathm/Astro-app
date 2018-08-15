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

ActiveRecord::Schema.define(version: 20180815091718) do

  create_table "basic_heroscopes", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.time     "time"
    t.float    "lat"
    t.float    "lon"
    t.float    "tzone"
    t.string   "ascendant"
    t.string   "varna"
    t.string   "vashya"
    t.string   "yoni"
    t.string   "gana"
    t.string   "nadi"
    t.string   "rashi_adipathi"
    t.string   "rashi"
    t.string   "nakshtra"
    t.string   "nakshtra_adipathi"
    t.string   "charan"
    t.string   "yog"
    t.string   "karan"
    t.string   "tithi"
    t.string   "yunja"
    t.string   "tatva"
    t.string   "name_alphabet"
    t.string   "paya"
    t.string   "birth_place"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end