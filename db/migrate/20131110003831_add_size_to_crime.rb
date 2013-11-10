class AddSizeToCrime < ActiveRecord::Migration
  def change
    rename_column :crimes, :latitude, :lat
    rename_column :crimes, :longitude, :long
    add_column :crimes, :size, :float
  end
end
