class Race < ActiveRecord::Base
  attr_accessible :county_id, :year, :bangladeshi, :bhutanese, :burmese, :cambodian, :chinese, :filipino, :hmong, :indian, :indonesian, :japanese, :korean, :laotian, :malaysian, :nepalese, :pakistani, :srilankan, :taiwanese, :thai, :vietnamese
  belongs_to :county

  # def html
   #{}"<b>"+self.county.name.to_s+"</b><br>"
  #end     
  @number



  def name(name)
    
     @number=self.attributes[name]
  end

  def as_json options={}
    {
      #:lat => self.county.cities.first().latitude, 
      #:lng => self.county.cities.first().longitude,
      :lat => lat,
      :lng => lng,
      :size => @number,
     # :html => 
    }
  end
end
