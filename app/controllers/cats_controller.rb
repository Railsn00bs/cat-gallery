class CatsController < ApplicationController
  def index
    # by default, show the user the index view
  end

  def create
    Cat.create!(:image_url => params[:cat][:image_url])

    redirect_to :action => :index
  end
end
