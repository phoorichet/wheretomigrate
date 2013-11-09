class RacesController < ApplicationController

  def race_bangladeshi
    race("bangladeshi")

  end


  def race_bhutanese
    race("bhutanese")

  end

  def race_burmese
    race("burmese")

  end

  def race_cambodian
    race("cambodian")

  end

  def race_chinese
    race("chinese")

  end

  def race_filipino
    race("filipino")

  end

  def race_hmong
    race("hmong")

  end

  def race_indian
    race("indian")

  end

  def race_indonesian
    race("indonesian")

  end
  def race_japanese
    race("japanese")

  end
  def race_korean
    race("korean")

  end
  def race_laotian
    race("laotian")

  end

  def race_malaysian
    race("malaysian")

  end
  def race_nepalese
    race("nepalese")

  end
  def race_pakistani
    race("pakistani")

  end
 def race_srilankan
    race("srilankan")

  end
 def race_taiwanese
    race("taiwanese")

  end
 def race_thai
    race("thai")

  end


 def race_vietnamese
    race("vietnamese")

  end



  

  # GET /races
  # GET /races.json
  def race(name)
    @races=[]
    Race.all.map do |c|  
      if !c.county.nil? && !c.county.cities.nil? && !c.county.cities.first().nil?
        

        @races.push({:size => c.name(name), :lat => c.county.cities.first().latitude, :lng => c.county.cities.first().longitude} )
      end
    end
    #@races = Race.where(["id = ?", 1]).select("county_id,bangladeshi")
    #@races.name()

  

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @races }
    end
  end

  # GET /races
  # GET /races.json
  def index
    @races=[]
    Race.all.map do |c|  
      if !c.county.nil? && !c.county.cities.nil? && !c.county.cities.first().nil?
        

        @races.push({:size => c.name(params[:name]), :lat => c.county.cities.first().latitude, :lng => c.county.cities.first().longitude} )
      end
    end
    #@races = Race.where(["id = ?", 1]).select("county_id,bangladeshi")
    #@races.name()

  

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @races }
    end
  end

  # GET /races/1
  # GET /races/1.json
  def show
    @race = Race.find(params[:id]) 

    @race.name(params[:name])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @race }
    end
  end

  # GET /races/new
  # GET /races/new.json
  def new
    @race = Race.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @race }
    end
  end

  # GET /races/1/edit
  def edit
    @race = Race.find(params[:id])
  end

  # POST /races
  # POST /races.json
  def create
    @race = Race.new(params[:race])

    respond_to do |format|
      if @race.save
        format.html { redirect_to @race, notice: 'Race was successfully created.' }
        format.json { render json: @race, status: :created, location: @race }
      else
        format.html { render action: "new" }
        format.json { render json: @race.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /races/1
  # PUT /races/1.json
  def update
    @race = Race.find(params[:id])

    respond_to do |format|
      if @race.update_attributes(params[:race])
        format.html { redirect_to @race, notice: 'Race was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @race.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /races/1
  # DELETE /races/1.json
  def destroy
    @race = Race.find(params[:id])
    @race.destroy

    respond_to do |format|
      format.html { redirect_to races_url }
      format.json { head :no_content }
    end
  end
end
