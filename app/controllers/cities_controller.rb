class CitiesController < ApplicationController
  # GET /cities
  # GET /cities.json
  def index
    @cities = City.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cities }
    end
  end

  # GET /cities/1
  # GET /cities/1.json
  def show
    @city = City.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @city }
    end
  end

  # GET /cities/new
  # GET /cities/new.json
  def new
    @city = City.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @city }
    end
  end

  # GET /cities/1/edit
  def edit
    @city = City.find(params[:id])
  end

  # POST /cities
  # POST /cities.json
  def create
    @city = City.new(params[:city])

    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: 'City was successfully created.' }
        format.json { render json: @city, status: :created, location: @city }
      else
        format.html { render action: "new" }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cities/1
  # PUT /cities/1.json
  def update
    @city = City.find(params[:id])

    respond_to do |format|
      if @city.update_attributes(params[:city])
        format.html { redirect_to @city, notice: 'City was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1
  # DELETE /cities/1.json
  def destroy
    @city = City.find(params[:id])
    @city.destroy

    respond_to do |format|
      format.html { redirect_to cities_url }
      format.json { head :no_content }
    end
  end

  def search
    #race should be one of these:  
    # :bangladeshi, :bhutanese, :burmese, :cambodian, :chinese, :filipino, :hmong, :indian, :indonesian, 
    # :japanese, :korean, :laotian, :malaysian, :nepalese, :pakistani, :srilankan, :taiwanese, :thai, :vietnamese

    city = params[:city]
    raceName = params[:race]
    
    city = city.titleize
    result = Hash.new
    transitScore = TransitScore.where("cityname like ?","%#{city}%").first
    result[:transit] ||= transitScore.transit_score.to_f / 100 if transitScore

    cityCostLiving = CostLiving.where("cityname like ?","%#{city}%").first
    result[:costliving] ||= cityCostLiving.size if cityCostLiving

    jobs = JobsCity.where("cityname like ?","%#{city}%").first
    jobs_query = "MAX(CAST(numberjobs*1000 AS float)/CAST(population AS float))"
    jobs_div_pop_max = JobsCity.connection.select_all("SELECT #{jobs_query} FROM jobs_cities").first[jobs_query]
    result[:jobs] ||= jobs.numberjobs.to_f / jobs_div_pop_max if jobs

    
    crime = nil
    race = nil
    city_found = City.where("city like ?","%#{city}%").first
    if city_found && city_found.county
      puts "  >> city found #{city_found}"
      county_id = city_found.county.id
      crime = Crime.find_by_county_id(county_id)
      race = Race.find_by_county_id(county_id)
    end

    # Find race max number
    raceMaxNumber ||= Race.maximum(raceName) if raceName 

    result[:crime] ||= crime.size if crime
    result[:race] ||=  race.name(raceName).to_f/raceMaxNumber if race && raceName
           


    data = Hash.new
    # data[:field] = [:costliving, :jobs, :crime, :race, :transit]
    data[:data] = result
    data[:city] ||= city_found.city if city_found
    data[:latitude] ||= city_found.latitude if city_found
    data[:longitude] ||= city_found.longitude if city_found


    render json: data


    # if cityCostLiving.nil? || jobs.nil? || crime.nil? || race.nil?
    #   render json: {}
    # else
    #   result={ :costLiving => cityCostLiving.size, :jobs => jobs.numberJobs.to_f / jobs_div_pop_max,
    #   :crime => crime.size, :raceNumber => race.name(raceName).to_f/raceMaxNumber }

    #   unless transitScore.nil?
    #     result[:transitScore] = transitScore.transit_score.to_f / 100
    #   end
    #   render json: result
    # end

  end

end
