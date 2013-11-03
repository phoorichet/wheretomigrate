class JobsCity < ActiveRecord::Base
  attr_accessible :cityName, :latitude, :longitude, :numberJobs, :population, :stateName
end
