class SearchesController < ApplicationController
  before_action :requires_sign_in
  
  def index
    @questions = Question.where('body LIKE ?', "%#{params[:search_question][:body]}%")
  end
end