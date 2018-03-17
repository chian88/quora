class QuestionsController < ApplicationController
  def index
    @questions = Question.where(user: User.first)
  end

  def show
    @question = Question.find(params[:id])
  end
end