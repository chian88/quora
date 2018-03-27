class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_new_question

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def requires_sign_in
    unless logged_in?
      flash[:warning] = "You are required to be logged in."
      redirect_to root_path
    end
  end

  private

  def set_new_question
    @new_question = Question.new
  end
end
