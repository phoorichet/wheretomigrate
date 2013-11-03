# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
  # cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
  # Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'    

def init_counties
  csv_text = File.read('res/races-by-county.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    County.create(id: row['GEO.id2'], name: row['GEO.display-label'])
  end
end

def add_races
  csv_text = File.read('res/races-by-county.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    Race.create(county_id: row['GEO.id2'], \
      year: 2010,\
      indian: row['HD01_S01'],\
      bangladeshi: row['HD01_S02'],\
      bhutanese: row['HD01_S03'],\
      burmese: row['HD01_S04'],\
      cambodian: row['HD01_S05'],\
      chinese: row['HD01_S06'],\
      filipino: row['HD01_S07'],\
      hmong: row['HD01_S08'],\
      indonesian: row['HD01_S09'],\
      japanese: row['HD01_S10'],\
      korean: row['HD01_S11'],\
      laotian: row['HD01_S12'],\
      malaysian: row['HD01_S13'],\
      nepalese: row['HD01_S14'],\
      pakistani: row['HD01_S15'],\
      srilankan: row['HD01_S16'],\
      taiwanese: row['HD01_S17'],\
      thai: row['HD01_S18'],\
      vietnamese: row['HD01_S19'],\
      )
  end
end
# add_races()

# For citi model
require 'wtl/city_us'

###load_city_seed()
