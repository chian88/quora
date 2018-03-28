class PagesController < ApplicationController 
  def front
    redirect_to pages_path if logged_in?
  end

  def index
    if params[:sort] == 'top_views'
      @questions = Question.all.order(views: :desc).paginate(:page => params[:page])
    else
      @questions = Question.all.order(created_at: :desc).paginate(:page => params[:page])
    end
  end
end