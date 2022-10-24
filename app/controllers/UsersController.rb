class UsersController < ApplicationController
  def index
    Users.all
  end

  def show
    Users.find(params[:id])
  end
end