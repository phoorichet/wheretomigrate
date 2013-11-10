class AddIndexedOnTables < ActiveRecord::Migration
  def up
    add_index :cities, :city
    add_index :cities, :county_name
    add_index :transit_scores, :cityName
    add_index :cost_livings, :cityName
    add_index :jobs_cities, :cityName
    add_index :races, :county_id
    add_index :crimes, :county_id
  end

  def down
  end
end
