class CatsController < ApplicationController
  before_action :authenticate_user!, only: [:my_cats]

  def index
    # by default, show the user the index view
  end

  def create
    Cat.create!(
      :image_url => params[:cat][:image_url],
      :user => current_user,
      :image => params[:cat][:image]
    )

    redirect_to :action => :index
  end

  def my_cats
  end
end
