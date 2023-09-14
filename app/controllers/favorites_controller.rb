class FavoritesController < ApplicationController
  before_action :set_question

  def create
    @favorite = Favorite.new(user_id: current_user.id, question_id: @question.id)
    @favorite.save
  end

  def destory
    @favorite = Favorite.find_by(user_id: current_user.id, question_id: @question.id)
    @favorite.destory
  end

  private

  def set_question
    @question = Question.find_by(id: params[:question_id])
  end
end
