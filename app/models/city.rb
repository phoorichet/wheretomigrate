class City < ActiveRecord::Base
  attr_accessible :city, :county, :latitude, :longitude, :state, :zip_code
end
