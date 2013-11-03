class CreateCostLivings < ActiveRecord::Migration
  def change
    create_table :cost_livings do |t|
      t.string :cityName
      t.float :lat
      t.float :long
      t.float :size
      t.float :compositeIndex
      t.float :groceryItems
      t.float :housing
      t.float :utilities
      t.float :transportation
      t.float :healthcare

      t.timestamps
    end
  end
end
