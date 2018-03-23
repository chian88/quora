class SearchesController < ApplicationController
  def index
    @questions = Question.where('body LIKE ?', "%#{params[:question][:body]}%")
  end
end