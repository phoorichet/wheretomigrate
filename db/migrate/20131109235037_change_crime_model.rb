class ChangeCrimeModel < ActiveRecord::Migration
  def change
    remove_column :crimes, :city_id
    remove_column :crimes, :population
    remove_column :crimes, :total_law_enforcement_employees
    add_column :crimes, :state, :string
    add_column :crimes, :county, :string
    add_column :crimes, :county_id, :integer
    add_column :crimes, :violent, :integer
    add_column :crimes, :murder, :integer
    add_column :crimes, :forcible_rape, :integer 
    add_column :crimes, :robbery, :integer
    add_column :crimes, :aggravated_assault, :integer 
    add_column :crimes, :property_crime,  :integer
    add_column :crimes, :burglary,  :integer
    add_column :crimes, :larcenytheft,  :integer
    add_column :crimes, :motor_vehicle_theft,  :integer
    add_column :crimes, :arson, :integer
    add_column :crimes, :latitude, :float
    add_column :crimes, :longitude, :float

  end

end
