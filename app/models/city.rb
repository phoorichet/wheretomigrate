class City < ActiveRecord::Base
  attr_accessible :city, :county_name, :latitude, :longitude, :state, :zip_code, :county_id

  belongs_to :county
  
end
