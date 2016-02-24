class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    session[:user_id].present?
  end

  def authorized?
    redirect_to signup_path, notice: "Not authorized" unless signed_in?
  end

  helper_method :current_user
  helper_method :signed_in?
end

