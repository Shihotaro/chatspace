class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(question_id: params[:question_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @question = Question.find(params[:question_id])
    @favorite = current_user.favorites.find_by(question_id: @question.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
