class RenameDbTableCaseInsensitive < ActiveRecord::Migration
  def change
    rename_column :cost_livings, :cityName, :cityname
    rename_column :jobs_cities, :cityName, :cityname
    rename_column :transit_scores, :cityName, :cityname
  end

end
