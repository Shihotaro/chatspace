class Admin::DashboardController < ApplicationController
  before_action :authenticate_user
  before_action :authorize_admin

  def index
    @questions = Question.all
  end

  def show
    @question = Question.includes(:answers).find_by(id: params[:id])
  end

  private

  def authorize_admin
    return if current_user&.admin?

    flash.now[:alert] = '管理者以外はアクセスできません。'
    redirect_to root_path
  end
end
