class RecordsController < ApplicationController
  before_action :redirect_to_signin
  before_action :set_record, only: %i[show edit update destroy]

  def index
    this_month_range = Time.current.beginning_of_month..Time.current.end_of_month
    @records = Record.where(user_id: session[:user_id], date: this_month_range).order(:date)

    @weight_data = @records.where(date: this_month_range).group_by_day(:date).average(:weight)
    @body_temperature_data = @records.where(date: this_month_range).group_by_day(:date).average(:body_temperature)
    @body_fat_percentage_data = @records.where(date: this_month_range).group_by_day(:date).average(:body_fat_percentage)
  end

  def show; end

  def new
    @record = Record.new
  end

  def create
    record_params = params.require(:record).permit(
      :date, :body_temperature, :weight, :body_fat_percentage,
      :condition, :memo
    )
    record_params[:user_id] = session[:user_id]
    @record = Record.new(record_params)
    @record.user_id = session[:user_id]
    if @record.save
      flash[:notice] = '保存しました'
      redirect_to records_path
    else
      flash.now[:alert] = '記録の保存に失敗しました'
      render :new
    end
  end

  def edit; end

  def update
    record_params = params.require(:record).permit(
      :date, :body_temperature, :weight, :body_fat_percentage,
      :condition, :memo
    )
    if @record.update(record_params)
      flash[:notice] = '記録を更新しました'
      redirect_to records_path
    else
      flash.now[:alert] = '記録の更新に失敗しました'
      render 'edit'
    end
  end

  def destroy
    @record.destroy
    flash[:notice] = '記録を削除しました'
    redirect_to records_path
  end

  private

  def set_record
    @record = Record.where(user_id: session[:user_id]).find(params[:id])
  end
end
