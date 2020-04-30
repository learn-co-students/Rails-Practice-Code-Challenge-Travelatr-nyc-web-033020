class BloggersController < ApplicationController
  
  before_action :find_blogger, only: [:show]
  def index
    @bloggers = Blogger.all
  end

  def show
    
  end

  def new
  end


  def create
  end

  private

  def find_blogger
    @blogger = Blogger.find(params[:id])
  end
end
