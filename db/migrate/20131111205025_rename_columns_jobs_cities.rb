class RenameColumnsJobsCities < ActiveRecord::Migration
  def change
    rename_column :jobs_cities, :numberJobs, :numberjobs
  end

end
