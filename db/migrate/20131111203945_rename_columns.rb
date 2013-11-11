class RenameColumns < ActiveRecord::Migration
  def change
    rename_column :transit_scores, :stateName, :statename
    rename_column :jobs_cities, :stateName, :statename

  end

end
