class DestinationsController < ApplicationController
  before_action :find_destination, only: [:show]
  
  
  def show
    @recent = @destination.five_most_recent_posts
  end

  private
  def find_destination
    @destination = Destination.find(params[:id])
  end
end
