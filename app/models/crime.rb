class Crime < ActiveRecord::Base
  attr_accessible :city_id, :population, :total_law_enforcement_employees
end
