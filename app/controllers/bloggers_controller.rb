class BloggersController < ApplicationController
    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.create(blogger_params)
        if @blogger.valid?
            redirect_to blogger_path(@blogger.id)
        else
            flash[:errors] = @blogger.errors.full_messages
            redirect_to new_blogger_path
        end
    end

    def show
        @blogger = Blogger.find(params[:id])
        @preferred_post = @blogger.most_like
        @total_likes = @blogger.sum_of_likes
    end

    private
    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end
end
