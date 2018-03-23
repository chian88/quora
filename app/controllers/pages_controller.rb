class PagesController < ApplicationController 

  def front
    if logged_in?
      redirect_to pages_path
    end
  end

  def index
    @questions = Question.all
  end
end