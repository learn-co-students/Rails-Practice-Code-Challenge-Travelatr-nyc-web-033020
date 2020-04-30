class DestinationsController < ApplicationController

  def index
    @destinations = Destination.all
  end

  def new
  end

  def show
    @destination = Destination.find(params[:id])
  end

  def create
  end

  private

  def destination_params
    params.require(:destination).permit(:name, :country)
  end
end
