class JobsCity < ActiveRecord::Base
  attr_accessible :cityName, :latitude, :longitude, :numberJobs, :population, :stateName

	# Number of job openings per 1000 people
	def job_div_pop
		( numberJobs.to_f / population ) * 1000
	end

	# Return the maximum of job_div_pop
	def job_div_pop_max
		JobsCity.connection.select_all("SELECT MAX(CAST(#{self.numberJobs}*1000 AS float)/CAST(#{self.population} AS float)) FROM jobs_Cities")
	end

	def as_json options={}
	 {
		 lat: latitude,
		 lng: longitude,
		 size: job_div_pop,
		 pop: population,
		 html: "<h1>" + cityName + "</h1>" + "Job openings per 1000 people: "+job_div_pop.to_s
	 }
	end
end
