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

ActiveRecord::Schema.define(:version => 20131110005055) do

  create_table "cities", :force => true do |t|
    t.string   "zip_code"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "city"
    t.string   "state"
    t.string   "county_name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "county_id"
  end

  create_table "cost_livings", :force => true do |t|
    t.string   "cityName"
    t.float    "lat"
    t.float    "long"
    t.float    "size"
    t.float    "compositeIndex"
    t.float    "groceryItems"
    t.float    "housing"
    t.float    "utilities"
    t.float    "transportation"
    t.float    "healthcare"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "counties", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "state"
    t.integer  "state_id"
    t.integer  "geo_id"
    t.string   "geometry"
  end

  create_table "crimes", :force => true do |t|
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "state"
    t.string   "county"
    t.integer  "county_id"
    t.integer  "violent"
    t.integer  "murder"
    t.integer  "forcible_rape"
    t.integer  "robbery"
    t.integer  "aggravated_assault"
    t.integer  "property_crime"
    t.integer  "burglary"
    t.integer  "larcenytheft"
    t.integer  "motor_vehicle_theft"
    t.integer  "arson"
    t.float    "lat"
    t.float    "lng"
    t.float    "size"
    t.integer  "total"
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
    t.float    "lat"
    t.float    "lng"
  end

  create_table "transit_scores", :force => true do |t|
    t.string   "cityName"
    t.string   "stateName"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "transit_score"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
