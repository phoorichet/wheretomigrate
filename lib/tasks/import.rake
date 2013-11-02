require 'csv'

desc "Import teams from csv file"
task :import => [:environment] do

  file = "db/citiesList.csv"

  CSV.foreach(file, :headers => true) do |row|
  	unless row[4].nil?
  	  	coordinates=row[4].split(',')

  	  	@jobsCity=JobsCity.new
		@jobsCity.cityName=row[1]
		@jobsCity.stateName=row[2]
		@jobsCity.latitude=coordinates[0].to_f
		@jobsCity.longitude=coordinates[1].to_f

		@jobsCity.population=row[3]

		@jobsCity.save
	end
  end







end