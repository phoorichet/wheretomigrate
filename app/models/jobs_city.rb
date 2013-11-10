class JobsCity < ActiveRecord::Base
  attr_accessible :cityName, :latitude, :longitude, :numberJobs, :population, :stateName

	def job_div_pop
		( numberJobs.to_f / population ) * 1000
	end

	def as_json options={}
	 {
		 lat: latitude,
		 lng: longitude,
		 size: job_div_pop,
		 pop: population,
		 html: cityName+ "<br>"+"Job opennings per 1000 people: "+job_div_pop.to_s
	 }
	end
end
