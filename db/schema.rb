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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131102230650) do


  create_table "cities", :force => true do |t|
    t.string   "zip_code"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "city"
    t.string   "state"
    t.string   "county"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "counties", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "jobs_cities", :force => true do |t|
    t.string   "cityName"
    t.string   "stateName"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "population"
    t.integer  "numberJobs"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "races", :force => true do |t|
    t.integer  "county_id"
    t.integer  "year"
    t.integer  "indian"
    t.integer  "bangladeshi"
    t.integer  "bhutanese"
    t.integer  "burmese"
    t.integer  "cambodian"
    t.integer  "chinese"
    t.integer  "filipino"
    t.integer  "hmong"
    t.integer  "indonesian"
    t.integer  "japanese"
    t.integer  "korean"
    t.integer  "laotian"
    t.integer  "malaysian"
    t.integer  "nepalese"
    t.integer  "pakistani"
    t.integer  "srilankan"
    t.integer  "taiwanese"
    t.integer  "thai"
    t.integer  "vietnamese"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
