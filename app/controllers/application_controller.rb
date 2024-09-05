class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def authenticate_user
    return if current_user

    redirect_to login_path, alert: "Please log in to continue"
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
