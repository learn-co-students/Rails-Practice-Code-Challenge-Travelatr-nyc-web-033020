class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :add]

  def show
  end

  def new
    @post = Post.new
    
  end

  def create
    @post = Post.create(post_params(:title, :content, :blogger_id, :destination_id))
    if @post.valid?
      redirect_to post_path(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_path
    end
  end

  def edit

  end

  def update
    @post.update(post_params(:title, :content, :blogger_id, :destination_id))
    if @post.valid?
      redirect_to post_path(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to edit_post_path
    end
  end

  def add
    # byebug
    @post.add_like
    @post.save
    redirect_to post_path(@post)
  end

  private
  def find_post
    @post = Post.find(params[:id])
  end

  def post_params(*args)
    params.require(:post).permit(*args)
  end
end
