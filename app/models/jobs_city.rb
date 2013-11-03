class JobsCity < ActiveRecord::Base
  attr_accessible :cityName, :latitude, :longitude, :numberJobs, :population, :stateName


def as_json options={}
 {
   lat: latitude,
   lng: longitude,
   size: numberJobs.to_f / JobsCity.maximum("numberJobs"),
   html: cityName+ "<br>"+"Job opennings: "+numberJobs.to_s

  
 }
end

end
