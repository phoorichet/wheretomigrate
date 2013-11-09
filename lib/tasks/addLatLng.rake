 

desc "Import teams from csv file"
task :addLatLng => [:environment] do

    Race.all.map do |c|  
      if !c.county.nil? && !c.county.cities.nil? && !c.county.cities.first().nil?
         #       @races.push({:size => c.name(name), :lat => c.county.cities.first().latitude, :lng => c.county.cities.first().longitude} )

  
      	c.update_attribute(:lat,c.county.cities.first().latitude)
      	c.update_attribute(:lng,c.county.cities.first().longitude)

      end
    end


 end