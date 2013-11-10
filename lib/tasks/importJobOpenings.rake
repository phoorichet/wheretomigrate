require 'csv'
require "net/http"
require 'rexml/document'


desc "Import teams from csv file"
task :importJobOpenings => [:environment] do

  file = "db/citiesList.csv"
  count=0
  CSV.foreach(file, :headers => true) do |row|

#|| count>0
  	unless row[4].nil?

			coordinates=row[4].split(',')
			coordinates[1]="-"+coordinates[1]
			@jobsCity=JobsCity.new
			@jobsCity.cityName=row[1]
			@jobsCity.stateName=row[2]
			@jobsCity.latitude=coordinates[0].to_f
			@jobsCity.longitude=coordinates[1].to_f

			row[3].gsub!(',','') if row[3].is_a?(String)
			@jobsCity.population = row[3].to_i

					#uri="http://api.careerbuilder.com/v1/jobsearch?DeveloperKey=WDHL04X6PSQYRX0JT0MS&Category=JN051"
			uri = URI.parse("http://api.careerbuilder.com/v1/jobsearch?DeveloperKey=WDHL04X6PSQYRX0JT0MS&Category=JN051&Location="+coordinates[0]+"::"+coordinates[1])
				http = Net::HTTP.new(uri.host, uri.port)
				response = http.request(Net::HTTP::Get.new(uri.request_uri))

			r = REXML::Document.new(response.body)
			@jobsCity.numberJobs=r.elements['ResponseJobSearch/TotalCount'].text.to_i

			@jobsCity.save

			count=count+1
		end
	end
end