require 'csv'

def load_city_seed

   CSV.foreach( 'script/zip_codes_states.csv', {:headers => true,
                                    :header_converters => :symbol
      }) do |line|

     data = line.to_hash
     if (data[:latitude] != nil)
       data[:latitude] = Float(data[:latitude])
     end
     if (data[:longitude] != nil)
       data[:longitude] = Float(data[:longitude])
     end

     data[:id] = data[:zip_code]
     puts data
     City.new(data).save
   end

end



#load_city_seed()
