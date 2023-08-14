class ApplicationController < ActionController::Base
  def redirect_to_signin
    redirect_to login_path if session[:user_id].blank?
  end
end
