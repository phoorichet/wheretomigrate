class CreateCrimes < ActiveRecord::Migration
  def change
    create_table :crimes do |t|
      t.integer :city_id
      t.string :population
      t.integer :total_law_enforcement_employees

      t.timestamps
    end
  end
end
