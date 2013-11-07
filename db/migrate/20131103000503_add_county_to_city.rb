class AddCountyToCity < ActiveRecord::Migration
  def change
    add_column :cities, :county_id, :integer
  end
end
