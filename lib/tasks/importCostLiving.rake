require 'csv'



desc "Import teams from csv file"
task :importCostLiving => [:environment] do

  file = "db/living.csv"
  CSV.foreach(file, :headers => true) do |row|

#|| count>0
  	
  	
  	  	@costLiving=CostLiving.new
		@costLiving.cityName=row[0]
		@costLiving.lat=row[1].to_f
		@costLiving.long=row[2].to_f
		@costLiving.size=row[3].to_f
		@costLiving.compositeIndex=row[4].to_f
		@costLiving.groceryItems=row[5].to_f
		@costLiving.housing=row[6].to_f
		@costLiving.utilities=row[7].to_f
		@costLiving.transportation=row[8].to_f
		@costLiving.healthcare=row[9].to_f

		@costLiving.save

	
  end







end