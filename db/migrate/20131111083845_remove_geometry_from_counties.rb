class RemoveGeometryFromCounties < ActiveRecord::Migration
  def change
    remove_column :counties, :geometry
  end

end
