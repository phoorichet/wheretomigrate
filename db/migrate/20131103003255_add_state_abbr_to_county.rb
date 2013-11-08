class AddStateAbbrToCounty < ActiveRecord::Migration
  def change
    add_column :counties, :state_abbr, :string
  end
end
