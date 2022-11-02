class UsersController < ApplicationController
  def index
    @users = User.all.order('created_at') # eager load the posts
  end

  def show
    @user = User.includes(:posts).find(params[:id])
    @posts = @user.recent_posts
  end
end
