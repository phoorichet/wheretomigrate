class StaticPagesController < ApplicationController
  def main
  end

  def city

    city = params[:city]

	cityCostLiving=CostLiving.where("cityname like ?","%#{city}%").first
	jobs=JobsCity.where("cityname like ?","%#{city}%").first
	if 	cityCostLiving.nil? || jobs.nil?
     render json: {}
    else
	
	result={ :costLiving => cityCostLiving.size, :jobs => jobs.numberJobs.to_f / JobsCity.maximum("numberJobs")  }
	#puts cityCostLiving.compositeIndex
	render json: result
	end
  end

  

end
