class LiftersController < ApplicationController
  before_action :set_lifter, only: [:show, :edit, :update, :destroy]

  # GET /lifters
  # GET /lifters.json
  def index
    @lifters = Lifter.page(params[:page]).per(5)
  end

  # GET /lifters/1
  # GET /lifters/1.json
  def show
    @lifter
    @gear_bps = Benchpress.where("lifter_id = ?",@lifter.id)
    #@lifter.benchpress_record(true)
    @bps = [] 
    #@lifter.benchpress_record(false)
    @pls = Powerlifting.where("lifter_id = ?",@lifter.id)
    p @gear_bps
    p @bps


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
