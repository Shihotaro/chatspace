class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @question.answers.create(answer_params)
    redirect_to question_path(@question)
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    if current_user&.admin?
      # 管理者用のリダイレクト先
      redirect_to admin_path(@question)
    else
      # 通常ユーザーのリダイレクト先
      redirect_to @question
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:name, :content)
  end
end
