class Api::PostsController < ApplicationController
  before_action :authorize_request

  def index
    @posts = Post.all.order('created_at')
    render json: { success: true, data: { posts: @posts } }
  end
end
