class AddTotalToCrime < ActiveRecord::Migration
  def change
    rename_column :crimes, :long, :lng
    add_column :crimes, :total, :integer
  end
end
