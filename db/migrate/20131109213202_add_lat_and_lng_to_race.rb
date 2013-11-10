class AddLatAndLngToRace < ActiveRecord::Migration
  def change
    add_column :races, :lat, :float
    add_column :races, :lng, :float

  end
end
