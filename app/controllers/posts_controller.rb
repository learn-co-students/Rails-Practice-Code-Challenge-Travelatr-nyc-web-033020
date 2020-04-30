class PostsController < ApplicationController
  def new
    @post = Post.new
    @bloggers = Blogger.all 
    @destinations = Destination.all 
  end

  def create 
    @post = Post.new(post_params) 

    if @post.save 
      redirect_to post_path(@post) 
    else  
      flash[:errors] = Post.errors.full_messages 
      redirect_to new_post_path 
    end 
  end

  def edit
    @post = Post.find(params[:id]) 
    @bloggers = Blogger.all 
    @destinations = Destination.all 
  end

  def update 
    @post = Post.find(params[:id]) 

    if @post.update(post_params) 
      redirect_to post_path(@post) 
    else  
      flash[:errors] = Post.errors.full_messages 
      redirect_to edit_post_path 
    end 
  end 

  def index
    @posts = Post.all 
  end

  def show
    @post = Post.find(params[:id]) 
  end

  def like_post 
    @post = Post.find(params[:id]) 
    @post.update(likes: @post.likes + 1) 
    redirect_to post_path(@post) 
  end 

  def destroy 
    @post = Post.find(params[:id]) 
    @post.destroy 
    redirect_to posts_url 
  end 

  private 

  def post_params 
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id) 
  end 
end
