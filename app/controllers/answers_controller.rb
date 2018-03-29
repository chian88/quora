class AnswersController < ApplicationController
  before_action :requires_sign_in
  before_action :requires_answer_owner, only: [:destroy]
  
  def create
    question = Question.find_by slug: params[:question_slug]
    additional_params = { 
      question_id: question.id,
      user: current_user
    }
    
    @answer = Answer.new(answer_params.merge(additional_params))

    if @answer.save
      flash[:success] = "Your answer successfully posted."
      @answer.generate_answer_notification(current_user)
      redirect_to question_path(params[:question_slug])
    else
      flash[:warning] = @answer.errors.messages[:body].first
      redirect_to question_path(params[:question_slug])
    end
  end

  def vote
    @answer = Answer.find(params[:id])
    @vote = @answer.votes.create(user: current_user, value: true)
    @answer.generate_vote_notification(current_user) if @vote.valid?

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @answer.destroy
    redirect_to question_path(params[:question_slug])
  end

  private

  def requires_answer_owner
    @answer = Answer.find(params[:id])
    unless current_user == @answer.user
      flash[:warning] = "Only can be deleted by answer owner."
      redirect_to question_path(params[:question_slug])
    end
  end

  def answer_params
    params.require(:answer).permit(:body)
  end
end