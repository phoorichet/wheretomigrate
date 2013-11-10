class StaticPagesController < ApplicationController
  def main
  end

  def city
	#race should be one of these:  
	# :bangladeshi, :bhutanese, :burmese, :cambodian, :chinese, :filipino, :hmong, :indian, :indonesian, 
	# :japanese, :korean, :laotian, :malaysian, :nepalese, :pakistani, :srilankan, :taiwanese, :thai, :vietnamese

    city = params[:city]
    raceName = params[:race]

	cityCostLiving=CostLiving.where("cityname like ?","%#{city}%").first
	jobs=JobsCity.where("cityname like ?","%#{city}%").first
	county_id=City.where("city like ?","%#{city}%").first.county.id
	crime=Crime.find_by_county_id(county_id)
	race=Race.find_by_county_id(county_id)
	raceMaxNumber=Race.maximum(raceName)
	if 	cityCostLiving.nil? || jobs.nil? || crime.nil? || race.nil? 
     render json: {}
    else
	
	result={ :costLiving => cityCostLiving.size, :jobs => jobs.numberJobs.to_f / JobsCity.maximum("numberJobs"),
		:crime => crime.size, :raceNumber => race.name(raceName).to_f/raceMaxNumber  }
	#puts cityCostLiving.compositeIndex
	render json: result
	end
  end

  

end
