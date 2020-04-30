class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :add]

    def add
        # byebug
        @post.add_like
        @post.save
        redirect_to post_path(@post)
      end

    def index
        @posts = Post.all
    end

    def show
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to post_path(@post)
        else
            flash[:errors]=@post.errors.full_messages
            redirect_to new_post_path
        end
    end

    def edit
    end

    def update 
        @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to post_path(@post)
    end

    def like
        @post = Post.find(post_params)
        @post.likes += 1
        redirect_to post_path(@post)
    end

    def destroy
        
    end

    private

    def post_params
        params.require(:post).permit(:title,:content,:blogger_id,:destination_id, :likes)
    end

    def find_post
        @post = Post.find(params[:id])
      end
end
