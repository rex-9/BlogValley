class PostsController < ApplicationController
  def index
    Posts.where(user_id: params[:user_id])
  end

  def show
    Posts.find(params[:id])
  end
end