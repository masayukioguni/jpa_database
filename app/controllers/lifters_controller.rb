class LiftersController < ApplicationController
  before_action :set_lifter, only: [:show, :edit, :update, :destroy]

  # GET /lifters
  # GET /lifters.json
  def index
    @lifters = Lifter.all
  end

  # GET /lifters/1
  # GET /lifters/1.json
  def show
    @lifter
  end

  # GET /lifters/new
  def new
    @lifter = Lifter.new
  end

  # GET /lifters/1/edit
  def edit
  end

  # POST /lifters
  # POST /lifters.json
  def create
    @lifter = Lifter.new(lifter_params)

    respond_to do |format|
      if @lifter.save
        format.html { redirect_to @lifter, notice: 'Lifter was successfully created.' }
        format.json { render :show, status: :created, location: @lifter }
      else
        format.html { render :new }
        format.json { render json: @lifter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lifters/1
  # PATCH/PUT /lifters/1.json
  def update
    respond_to do |format|
      if @lifter.update(lifter_params)
        format.html { redirect_to @lifter, notice: 'Lifter was successfully updated.' }
        format.json { render :show, status: :ok, location: @lifter }
      else
        format.html { render :edit }
        format.json { render json: @lifter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lifters/1
  # DELETE /lifters/1.json
  def destroy
    @lifter.destroy
    respond_to do |format|
      format.html { redirect_to lifters_url, notice: 'Lifter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lifter
      @lifter = Lifter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lifter_params
      params.require(:lifter).permit(:index, :show)
    end
end
