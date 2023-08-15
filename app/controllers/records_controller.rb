class RecordsController < ApplicationController
  def index
    @records = Record.where(user_id: session[:user_id])
    @records = @records.where(date: params[:date]) if params[:date].present?
  end

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

  def set_record
    @record = Record.where(user_id: session[:user_id]).find(params[:id])
  end
end
