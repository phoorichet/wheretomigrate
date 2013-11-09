class CostLivingsController < ApplicationController
  # GET /cost_livings
  # GET /cost_livings.json
  def index
    #@cost_livings = CostLiving.all
    @cost_livings = CostLiving.all().take(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cost_livings }
    end
  end

  # GET /cost_livings/1
  # GET /cost_livings/1.json
  def show
    @cost_living = CostLiving.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cost_living }
    end
  end

  # GET /cost_livings/new
  # GET /cost_livings/new.json
  def new
    @cost_living = CostLiving.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cost_living }
    end
  end

  # GET /cost_livings/1/edit
  def edit
    @cost_living = CostLiving.find(params[:id])
  end

  # POST /cost_livings
  # POST /cost_livings.json
  def create
    @cost_living = CostLiving.new(params[:cost_living])

    respond_to do |format|
      if @cost_living.save
        format.html { redirect_to @cost_living, notice: 'Cost living was successfully created.' }
        format.json { render json: @cost_living, status: :created, location: @cost_living }
      else
        format.html { render action: "new" }
        format.json { render json: @cost_living.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cost_livings/1
  # PUT /cost_livings/1.json
  def update
    @cost_living = CostLiving.find(params[:id])

    respond_to do |format|
      if @cost_living.update_attributes(params[:cost_living])
        format.html { redirect_to @cost_living, notice: 'Cost living was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cost_living.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cost_livings/1
  # DELETE /cost_livings/1.json
  def destroy
    @cost_living = CostLiving.find(params[:id])
    @cost_living.destroy

    respond_to do |format|
      format.html { redirect_to cost_livings_url }
      format.json { head :no_content }
    end
  end
end
