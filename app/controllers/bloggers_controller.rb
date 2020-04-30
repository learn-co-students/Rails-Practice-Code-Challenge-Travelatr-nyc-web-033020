class BloggersController < ApplicationController
  def new
    @blogger = Blogger.new 
  end

  def create 
    @blogger = Blogger.new(blogger_params)

    if @blogger.save 
      redirect_to blogger_path(@blogger) 
    else  
      flash[:errors] = @blogger.errors.full_messages 
      redirect_to new_blogger_path 
    end 
  end 

  def edit
    @blogger = Blogger.find(params[:id]) 
  end

  def update 
    @blogger = Blogger.find(params[:id]) 

    if @blogger.update(blogger_params) 
      redirect_to blogger_path(@blogger) 
    else  
      flash[:errors] = @blogger.errors.full_messages 
      redirect_to edit_blogger_path 
    end 
  end 

  def index
    @bloggers = Blogger.all 
  end

  def show
    @blogger = Blogger.find(params[:id]) 
  end 

  def destroy 
    @blogger = Blogger.find(params[:id]) 
    @blogger.destroy 
    redirect_to bloggers_url 
  end 

  private 

  def blogger_params 
    params.require(:blogger).permit(:name, :age, :bio) 
  end 
end
