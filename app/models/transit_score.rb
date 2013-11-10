class TransitScore < ActiveRecord::Base
	include ApplicationHelper

  attr_accessible :cityName, :latitude, :longitude, :stateName, :transit_score

	def state_code
		convert_state_code(stateName)
	end
end
