class UsersController < ApplicationController
  before_action :redirect_to_signin, only: %i[show edit update]

  def show
    @questions = current_user.questions
    @favorites = current_user.favorites.includes(question: :favorites)
  end

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :email, :password, :password_confirmation)
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = '登録しました'
      redirect_to login_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    user_params = params.require(:user).permit(:name, :email)
    if @user.update(user_params)
      flash[:notice] = '更新しました'
      redirect_to edit_user_path
    else
      render 'edit'
    end
  end
end
