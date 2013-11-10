class StaticPagesController < ApplicationController
  def main
  end

  def city

    city = params[:city]

	cityCostLiving=CostLiving.where("cityname like ?","%#{city}%").first
	jobs=JobsCity.where("cityname like ?","%#{city}%").first
	crime=Crime.find_by_county_id(City.where("city like ?","%#{city}%").first.county.id)


	if 	cityCostLiving.nil? || jobs.nil?
     render json: {}
    else
	
	result={ :costLiving => cityCostLiving.size, :jobs => jobs.numberJobs.to_f / JobsCity.maximum("numberJobs"),:crime => crime.size  }
	#puts cityCostLiving.compositeIndex
	render json: result
	end
  end

  

end
