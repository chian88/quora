class AnswersController < ApplicationController
  before_action :requires_sign_in
  
  def create
    additional_params = { 
      question_id: params[:question_id],
      user: current_user
    }

    @answer = Answer.new(answer_params.merge additional_params)
    if @answer.save
      flash[:success] = "Your answer successfully posted."
      redirect_to question_path(params[:question_id])
    else

    end
  end

  def vote
    @answer = Answer.find(params[:id])
    @vote = Vote.create(user: current_user, answer: @answer, value: true)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    answer = Answer.find(params[:id])
    answer.destroy
    redirect_to question_path(params[:question_id])
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end