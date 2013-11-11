class County < ActiveRecord::Base
  attr_accessible :id, :name, :state, :state_id, :geo_id

  has_many :cities
end
