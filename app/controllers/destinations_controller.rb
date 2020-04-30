class DestinationsController < ApplicationController
    def index
        @destinations = Destination.all
    end

    def show
        @destination = Destination.find(params[:id])
    end

    def new
        @destination = Destination.new
    end

    def create
        @destination = Destination.new(destination_params)
        if @destination.save
            redirect_to destination_path(@destination)
        else
            flash[:errors]=@destination.errors.full_messages
            redirect_to new_destination_path
        end
    end

    def edit
        # @destination = Destination.find(params[:id])
    end

    def update
        
    end

    def destroy
        
    end

    private

    def destination_params
        params.require(:destination).permit(:name, :country)
    end
end

