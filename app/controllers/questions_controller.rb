require 'uri'
require 'net/http'
require 'json'

class QuestionsController < ApplicationController
  def index
    if params[:tag_search].present?
      tag = Tag.find_by(name: params[:tag_search])
      @questions = tag ? tag.questions : []
    elsif params[:search].present?
      @questions = Question.where('title LIKE ? OR content LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @questions = Question.includes(:tags).all
    end

    cities = ['Sapporo,jp', 'Sendai,jp', 'Tokyo,jp', 'Nagoya,jp', 'Osaka,jp', 'Fukuoka,jp', 'Naha,jp']
    @weather_data = []

    cities.each do |city|
      uri = URI("https://api.openweathermap.org/data/2.5/weather?q=#{city}&APPID=0ceca44706ea610d53a5304f3f0f3288")
      res = Net::HTTP.get_response(uri)
      body = JSON.parse(res.body)
      weather = {
        name: body['name'],
        icon: body.dig('weather', 0, 'icon')
      }
      @weather_data << weather
    end
  end

  def show
    @question = Question.includes(:tags).find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = session[:user_id]

    tag_list = params[:tag_names].split(',')
    if @question.save
      @question.save_tags(tag_list)
      flash[:notice] = '質問を作成しました'
      redirect_to @question
    else
      render 'new'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = '質問を削除しました'
    if current_user&.admin?
      # 管理者用のリダイレクト先
      redirect_to admin_dashboard_path
    else
      # 通常ユーザーのリダイレクト先
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :name, :content)
  end
end
