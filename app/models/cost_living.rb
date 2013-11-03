class CostLiving < ActiveRecord::Base
  attr_accessible :compositeIndex, :groceryItems, :healthcare, :housing, :cityName, :lat, :long, :size, :transportation, :utilities

   

   	def html


   		cityName+"<br>Composite Index: "+compositeIndex.to_s+"<br>Grocery Items: "+groceryItems.to_s+"<br>Healthcare Index: "+healthcare.to_s+"<br>Housing Index: "+housing.to_s+"<br>Transportation Index: "+transportation.to_s+"<br>Utilities Index: "+utilities.to_s

	end  		


	def as_json options={}
	 




	  { :lat => lat, 
	  	:lng => long,
	  	:size => size,
	  	:html => html



	  } 
	 
	 
	end

end