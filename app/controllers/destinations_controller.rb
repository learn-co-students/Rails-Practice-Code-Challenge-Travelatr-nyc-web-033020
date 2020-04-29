class DestinationsController < ApplicationController
    def show
        @destination = Destination.find(params[:id])
        @average = @destination.average_age
        @preferred_post = @destination.most_like
    end
end
