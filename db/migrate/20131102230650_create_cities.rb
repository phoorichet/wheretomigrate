class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :zip_code
      t.float :latitude
      t.float :longitude
      t.string :city
      t.string :state
      t.string :county

      t.timestamps
    end
  end
end
