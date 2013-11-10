class TransitScoresController < ApplicationController
  # GET /transit_scores
  # GET /transit_scores.json
  def index
    @transit_scores = TransitScore.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transit_scores }
    end
  end

  # GET /transit_scores/1
  # GET /transit_scores/1.json
  def show
    @transit_score = TransitScore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transit_score }
    end
  end

  # GET /transit_scores/new
  # GET /transit_scores/new.json
  def new
    @transit_score = TransitScore.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transit_score }
    end
  end

  # GET /transit_scores/1/edit
  def edit
    @transit_score = TransitScore.find(params[:id])
  end

  # POST /transit_scores
  # POST /transit_scores.json
  def create
    @transit_score = TransitScore.new(params[:transit_score])

    respond_to do |format|
      if @transit_score.save
        format.html { redirect_to @transit_score, notice: 'Transit score was successfully created.' }
        format.json { render json: @transit_score, status: :created, location: @transit_score }
      else
        format.html { render action: "new" }
        format.json { render json: @transit_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transit_scores/1
  # PUT /transit_scores/1.json
  def update
    @transit_score = TransitScore.find(params[:id])

    respond_to do |format|
      if @transit_score.update_attributes(params[:transit_score])
        format.html { redirect_to @transit_score, notice: 'Transit score was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transit_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transit_scores/1
  # DELETE /transit_scores/1.json
  def destroy
    @transit_score = TransitScore.find(params[:id])
    @transit_score.destroy

    respond_to do |format|
      format.html { redirect_to transit_scores_url }
      format.json { head :no_content }
    end
  end
end
