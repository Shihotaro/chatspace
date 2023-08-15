class RecordsController < ApplicationController
  def index
    @records = Record.where(user_id: session[:user_id])
    @records = @records.where(date: params[:date]) if params[:date].present?
  end

  def show
    @record = Record.find(params[:id])
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

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
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
    @record = Record.find(params[:id])
    @record.destroy
    flash[:notice] = '記録を削除しました'
    redirect_to records_path
  end

  private

  def set_record
    @record = Record.where(user_id: session[:user_id]).find(params[:id])
  end
end
