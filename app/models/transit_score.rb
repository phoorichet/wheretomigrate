class TransitScore < ActiveRecord::Base
	include ApplicationHelper

  attr_accessible :cityName, :latitude, :longitude, :stateName, :transit_score

	def state_code
		convert_state_code(stateName)
	end

	def as_json options={}
	 {
		 lat: latitude,
		 lng: longitude,
		 size: transit_score,
		 html: sprintf("<h2>%s,<small> %s</small></h2>" +
		 		"<b>Public Transportation Score:</b> <big>%d</big>",
		 		cityName, stateName, transit_score)
	 }
	end
end
