class County < ActiveRecord::Base
  attr_accessible :id, :name
  has_many :races
end
