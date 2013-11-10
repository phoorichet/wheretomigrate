require 'csv'

def load_us_cities
  count = 0
  count_error = 0
  options =  {:headers => true, :header_converters => :symbol}
  CSV.foreach( 'res/zip_codes_states.csv', options) do |line|
    data = Hash.new
    data[:id] = line[:zip_code].to_i   # user zip code as the id
    data[:zip_code] = line[:zip_code]
    data[:latitude] = Float(line[:latitude]) if line[:latitude]
    data[:longitude] = Float(line[:longitude]) if line[:longitude]
    data[:city] = line[:city].upcase
    data[:state] = line[:state].upcase if line[:state]
    data[:county_name] = line[:county].upcase if line[:county]

    county = County.where("state='#{data[:state]}' and name='#{data[:county_name]}'")
    if county.size > 0
      data[:county_id] = county[0].id
    else
      puts "  => [Error] Not found state for #{data[:city]}: query={state='#{data[:state]}' and name='#{data[:county_name]}'}"
      count_error += 1
    end
    
    City.new(data).save
    count += 1
  end
  
  puts "  => Imported Cities #{count} records. ErrorCount=#{count_error}"
end


def load_crime

  state_map = {
  'ALABAMA' => 'AL',
  'ALASKA' => 'AK',
  'ARIZONA' => 'AZ',
  'ARKANSAS' => 'AR',
  'CALIFORNIA' => 'CA',
  'COLORADO' => 'CO',
  'CONNECTICUT' => 'CT',
  'DELAWARE' => 'DE',
  'DISTRICT OF COLUMBIA' => 'DC',
  'FLORIDA' => 'FL',
  'GEORGIA' => 'GA',
  'HAWAII' => 'HI',
  'IDAHO' => 'ID',
  'ILLINOIS' => 'IL',
  'INDIANA' => 'IN',
  'IOWA' => 'IA',
  'KANSAS' => 'KS',
  'KENTUCKY' => 'KY',
  'LOUISIANA' => 'LA',
  'MAINE' => 'ME',
  'MARYLAND' => 'MD',
  'MASSACHUSETTS' => 'MA',
  'MICHIGAN' => 'MI',
  'MINNESOTA' => 'MN',
  'MISSISSIPPI' => 'MS',
  'MISSOURI' => 'MO',
  'MONTANA' => 'MT',
  'NEBRASKA' => 'NE',
  'NEVADA' => 'NV',
  'NEW HAMPSHIRE' => 'NH',
  'NEW JERSEY' => 'NJ',
  'NEW MEXICO' => 'NM',
  'NEW YORK' => 'NY',
  'NORTH CAROLINA' => 'NC',
  'NORTH DAKOTA' => 'ND',
  'OHIO' => 'OH',
  'OKLAHOMA' => 'OK',
  'OREGON' => 'OR',
  'PENNSYLVANIA' => 'PA',
  'RHODE ISLAND' => 'RI',
  'SOUTH CAROLINA' => 'SC',
  'SOUTH DAKOTA' => 'SD',
  'TENNESSEE' => 'TN',
  'TEXAS' => 'TX',
  'UTAH' => 'UT',
  'VERMONT' => 'VT',
  'VIRGINIA' => 'VA',
  'WASHINGTON' => 'WA',
  'WEST VIRGINIA' => 'WV',
  'WISCONSIN' => 'WI',
  'WYOMING' => 'WY'
}


  opt =  {:headers => true, :header_converters => :symbol, :converters => [:numeric] }
  CSV.foreach( 'res/crime_by_county.csv', opt) do |line|
    begin
     # puts line.to_hash
     data = Hash.new
     county = line[:county]
     state_full = line[:state]
     state = state_map[state_full]
     county_found = County.where("name='#{county.upcase}' and state='#{state}'")
     if county_found.size > 0
      county_found = county_found[0] if county_found.size > 0
      #puts "#{county_found.cities.first.latitude}, #{county_found.cities.first.longitude}"
      #puts county_found.id
      #puts " ====>name='#{county.upcase}' and state='#{state}' =>> #{county_found}"
      line[:county_id] = county_found.id
      line[:state] = state
      line[:latitude] = county_found.cities.first.latitude
      line[:longitude] = county_found.cities.first.longitude
      # Insert to the database
      Crime.create(line.to_hash)
      puts line.to_hash
     else
      puts " => Import Error: Not found county #{} in our database"
     end
    rescue 
      puts " => Import Error: SQL error"
    end

  end
end


def load_us_counties
  count = 0 
  options = {:headers => true, :header_converters => :symbol, :col_sep => "\t"}
  CSV.foreach( 'res/us_counties.txt', options) do |line|

    data =  Hash.new
    data[:id] = Integer(line[:county_id])
    data[:name] = line[:name].upcase if line[:name]
    data[:geo_id] = line[:geo_id]
    data[:geometry] = line[:geometry]
    data[:state_id] = Integer(line[:state_id]) # State ID
    data[:state] = line[:state].upcase().strip() if line[:state] # State Abbr

    County.new(data).save
    count += 1
  end

  puts "  => Imported County #{count} records"

end
