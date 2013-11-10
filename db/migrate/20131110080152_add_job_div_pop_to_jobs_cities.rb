class AddJobDivPopToJobsCities < ActiveRecord::Migration
  def change
    add_column :jobs_cities, :job_div_pop, :float
  end
end
