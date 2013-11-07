# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
  # cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
  # Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'    

csv_text = File.read('res/races-by-county.csv')
csv = CSV.parse(csv_text, :headers => true)
  
""" 
csv.each do |row|
  data = Hash.new
  data[:id] = row['GEO.id2']
  county_name =  row['GEO.display-label'].sub(' County', '')
  data[:name] = county_name.split(', ')[0]
  data[:state] = county_name.split(', ')[1]

  data[:state_abbr] = map[data[:state].upcase]

  County.create(data)
end
"""


# For citi model
require 'wtl/city_us'


#load_crime()
#load_us_counties()
load_us_cities()
