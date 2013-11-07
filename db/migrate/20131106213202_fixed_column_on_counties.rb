class FixedColumnOnCounties < ActiveRecord::Migration
  def change
    add_column :counties, :state_id, :integer
    add_column :counties, :geo_id, :integer
    add_column :counties, :geometry, :string
    remove_column :counties, :state_abbr
    
  end

end
