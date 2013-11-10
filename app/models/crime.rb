class Crime < ActiveRecord::Base
  attr_accessible :state, :county, :violent, :murder, :forcible_rape, :robbery, :aggravated_assault, :property_crime, :burglary, :larcenytheft, :motor_vehicle_theft, :arson, :county_id, :lat, :lng, :total, :size
end
