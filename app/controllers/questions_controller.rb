class QuestionsController < ApplicationController

  def index
    
  end
  
  def show
    
  end

  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def destroy
    
  end
  
  private

  def question_params
    params.require(:question).permit(:title, :name, :content)
  end
  
end
