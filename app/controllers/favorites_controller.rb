class FavoritesController < ApplicationController
  def create
    if current_user
      @favorite = current_user.favorites.create(question_id: params[:question_id])
      redirect_back(fallback_location: root_path)
      flash[:notice] = 'お気に入りに追加しました'
    else
      flash[:alert] = 'お気に入り機能にはログインが必要です'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @favorite = current_user.favorites.find_by(question_id: @question.id)
    @favorite.destroy
    flash[:notice] = 'お気に入りを削除しました'
    redirect_back(fallback_location: root_path)
  end
end
