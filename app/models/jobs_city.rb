class JobsCity < ActiveRecord::Base
  attr_accessible :cityname, :latitude, :longitude, :numberjobs, :population, :statename

	# Number of job openings per 1000 people
	def job_div_pop
		( numberJobs.to_f / population ) * 1000
	end

	# Return the maximum of job_div_pop
	def job_div_pop_max
		JobsCity.connection.select_all("SELECT MAX(CAST(#{self.numberJobs}*1000 AS float)/CAST(#{self.population} AS float)) FROM jobs_cities")
	end

	def as_json options={}
	 {
		 lat: latitude,
		 lng: longitude,
		 size: job_div_pop,
		 pop: population,
		 html: sprintf("<h2>%s,<small> %s</small></h2>" + 
		 		"<b>Job openings:</b> <big>%.2f</big> per thousand people", 
		 		cityname, statename, job_div_pop)
	 }
	end
end
