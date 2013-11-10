class CreateTransitScores < ActiveRecord::Migration
  def change
    create_table :transit_scores do |t|
      t.string :cityName
      t.string :stateName
      t.float :latitude
      t.float :longitude
      t.integer :transit_score

      t.timestamps
    end
  end
end
