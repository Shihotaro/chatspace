require 'uri'
require 'net/http'
require 'json'

class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    if params[:search_word].present? && params[:search_word] =~ /^[a-zA-Z]+$/
      uri = URI("https://api.nal.usda.gov/fdc/v1/foods/search?api_key=#{ENV['API_KEY']}&query=#{params[:search_word]}")
      res = Net::HTTP.get_response(uri)
      body = JSON.parse(res.body)
      @foods = body['foods']
    else
      @foods = []
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = '質問を作成しました'
      redirect_to @question
    else
      flash.now[:alert] = '質問の作成に失敗しました'
      render 'new'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :name, :content)
  end
end
