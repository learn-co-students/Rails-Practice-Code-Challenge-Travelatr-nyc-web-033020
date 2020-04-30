class PostsController < ApplicationController

    def new
      @post = Post.new
    end

    def create
      @post = Post.create(post_params)

      if @post.valid?
        redirect_to post_path(@post)
      else
        flash[:errors] = @post.errors.full_messages
        redirect_to new_blogger_path
      end
    end

    def show
      @post = Post.find(params[:id])
    end

    def increase_likes
      post = Post.find(params[:id])
      if post.likes
        post.likes +=1
      else
        post.likes = 1
      end
      post.save
      
      #byebug
      redirect_to post_path(post)
    end


    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])
      @post.update(post_params)
      redirect_to post_path(@post)
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to blogger_path(@post.blogger)
    end

    private

    def post_params
      params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
    end
end
