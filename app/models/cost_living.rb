class CostLiving < ActiveRecord::Base
  attr_accessible :compositeIndex, :groceryItems, :healthcare, :housing, :cityname, :lat, :long, :size, :transportation, :utilities

  def html
    sprintf("<h2>%s</h2>" + 
        "<b>Composite Index:</b> <big>%.1f</big><br>" + 
        "<b>Grocery Items:</b> <big>%.1f</big><br>" + 
        "<b>Healthcare Index:</b> <big>%.1f</big><br>" + 
        "<b>Housing Index:</b> <big>%.1f</big><br>" + 
        "<b>Transportation Index:</b> <big>%.1f</big><br>" + 
        "<b>Utilities Index:</b> <big>%.1f</big><br>",
        cityname, compositeIndex.to_f, groceryItems.to_f, healthcare.to_f, housing.to_f, transportation.to_f, utilities.to_f)
  end  		

  def as_json options={}
    {
      :lat => lat, 
      :lng => long,
      :size => size,
      :html => html
    }
  end

end
