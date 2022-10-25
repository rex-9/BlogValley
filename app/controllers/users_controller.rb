class UsersController < ApplicationController
  def index
    @users = User.all # eager load the posts
  end

  def show
    @user = User.find(params[:id]) # includes(:posts) is needed to eager load the posts
  end
end
