class ApplicationController < ActionController::Base
  helper_method :current_user

  def redirect_to_signin
    redirect_to login_path if session[:user_id].blank?
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
