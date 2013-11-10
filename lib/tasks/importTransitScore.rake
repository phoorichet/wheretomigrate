require 'csv'
require "httparty"
require 'active_support'

desc "Import city name from csv file and store with Transit Score in database"
# Reference
# HTTParty http://behindtechlines.com/2011/12/httparty-your-way-through-your-favorite-apis/
# ActiveSupport::JSON


task :importTransitScore => [:environment] do

  file = "db/citiesList.csv"
	api_key = "32c14eb566367a4fb67992c425824ba8"

	start_index=36
	number_to_call_API=44
  count=0
  CSV.foreach(file, :headers => true) do |row|

#|| count>0

	  # Skip row without valid information
		skip = false
		row.each do |column|
			# column has field and value, so look at only value
			if column[1].nil?
				skip = true
				break
			end
		end

		if skip
			next
		end

		count += 1
		if count < start_index
			next
		elsif count >= start_index + number_to_call_API
			break
		end

		coordinates=row[4].split(',')
		coordinates[1]="-"+coordinates[1]
		@score=TransitScore.new
		@score.cityName=row[1]
		@score.stateName=row[2]
		@score.latitude=coordinates[0].to_f
		@score.longitude=coordinates[1].to_f

		# Eliminate invalid state code
		if @score.state_code.nil?
			next
		end

=begin
		uri = URI.parse(URI.encode("http://transit.walkscore.com/transit/score/?lat="+coordinates[0]+"&lon="+coordinates[1]+
																 "&city="+@score.cityName+"&state="+@score.state_code+"&wsapikey="+api_key))
			http = Net::HTTP.new(uri.host, uri.port)
			response = http.request(Net::HTTP::Get.new(uri.request_uri))
=end

		# Obtain Transitscore from Walkscore API
		request_uri = "http://transit.walkscore.com/transit/score/?lat="+coordinates[0]+"&lon="+coordinates[1]+
																 "&city="+@score.cityName+"&state="+@score.state_code+"&wsapikey="+api_key
		response = HTTParty.get(URI.encode(request_uri))

		# Save information if the response is valid
		unless response.parsed_response.nil?
			@score.transit_score=response.parsed_response["transit_score"].to_i

			unless @score.transit_score == 0
				@score.save
			end
		end
	end
	puts count
end