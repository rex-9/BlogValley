class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def authorize_request
    header = request.headers['Authorization']
    header = header.split.last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @user_id = params[:user_id]
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: "JWT_ error: #{e.message}" }, status: :unauthorized
    else
      render json: { errors: 'Missing token' }, status: :unauthorized unless @decoded
    end
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :confirm_password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
