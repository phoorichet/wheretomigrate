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
csv.each do |row|
  County.create(id: row['GEO.id2'], name: row['GEO.display-label'])
  # County.create!(row.to_hash)
end