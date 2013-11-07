class JobsCitiesController < ApplicationController
  # GET /jobs_cities
  # GET /jobs_cities.json
  def index
    @jobs_cities = JobsCity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jobs_cities }
    end
  end

  # GET /jobs_cities/1
  # GET /jobs_cities/1.json
  def show
    @jobs_city = JobsCity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @jobs_city }
    end
  end

  # GET /jobs_cities/new
  # GET /jobs_cities/new.json
  def new
    @jobs_city = JobsCity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @jobs_city }
    end
  end

  # GET /jobs_cities/1/edit
  def edit
    @jobs_city = JobsCity.find(params[:id])
  end

  # POST /jobs_cities
  # POST /jobs_cities.json
  def create
    @jobs_city = JobsCity.new(params[:jobs_city])

    respond_to do |format|
      if @jobs_city.save
        format.html { redirect_to @jobs_city, notice: 'Jobs city was successfully created.' }
        format.json { render json: @jobs_city, status: :created, location: @jobs_city }
      else
        format.html { render action: "new" }
        format.json { render json: @jobs_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jobs_cities/1
  # PUT /jobs_cities/1.json
  def update
    @jobs_city = JobsCity.find(params[:id])

    respond_to do |format|
      if @jobs_city.update_attributes(params[:jobs_city])
        format.html { redirect_to @jobs_city, notice: 'Jobs city was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @jobs_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs_cities/1
  # DELETE /jobs_cities/1.json
  def destroy
    @jobs_city = JobsCity.find(params[:id])
    @jobs_city.destroy

    respond_to do |format|
      format.html { redirect_to jobs_cities_url }
      format.json { head :no_content }
    end
  end
end
