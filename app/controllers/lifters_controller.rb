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
