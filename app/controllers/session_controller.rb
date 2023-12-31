class SessionController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      flash[:notice] = 'ログインしました'
      session[:user_id] = user.id
      if current_user&.admin?
        redirect_to admin_dashboard_path
      else
        redirect_to mypage_path
      end
    else
      flash.now[:alert] = 'ログインに失敗しました'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  def guest_login
    user = User.find_by(email: 'guest@example.com')
    session[:user_id] = user.id
    redirect_to mypage_path
    flash[:notice] = 'ゲストとしてログインしました'
  end
end
