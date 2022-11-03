class UsersController < ApplicationController
  protect_from_forgery prepend: true
  def index
    @users = User.all.order('created_at')
  end

  def show
    @user = User.includes(:posts).find(params[:id])
    @posts = @user.recent_posts
  end
end
