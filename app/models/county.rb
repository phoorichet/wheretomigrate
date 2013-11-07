class County < ActiveRecord::Base
  attr_accessible :id, :name, :state, :state_id, :geo_id, :geometry

  has_many :cities
end
