class SessionController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      flash[:notice] = 'ログインしました'
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      flash.now[:alert] = 'ログインに失敗しました'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
