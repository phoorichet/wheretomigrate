class CreateJobsCities < ActiveRecord::Migration
  def change
    create_table :jobs_cities do |t|
      t.string :cityName
      t.string :stateName
      t.float :latitude
      t.float :longitude
      t.integer :population
      t.integer :numberJobs

      t.timestamps
    end
  end
end
