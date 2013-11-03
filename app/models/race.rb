class Race < ActiveRecord::Base
  attr_accessible :county_id, :year, :bangladeshi, :bhutanese, :burmese, :cambodian, :chinese, :filipino, :hmong, :indian, :indonesian, :japanese, :korean, :laotian, :malaysian, :nepalese, :pakistani, :srilankan, :taiwanese, :thai, :vietnamese
  belongs_to :county
end
