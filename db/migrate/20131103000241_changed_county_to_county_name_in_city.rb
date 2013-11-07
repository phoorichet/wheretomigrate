class ChangedCountyToCountyNameInCity < ActiveRecord::Migration

  def change
    rename_column :cities, :county, :county_name
  end

end
