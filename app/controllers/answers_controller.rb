class AnswersController < ApplicationController
  before_action :requires_sign_in
  before_action :requires_answer_owner, only: [:destroy]
  
  def create
    additional_params = { 
      question_id: params[:question_id],
      user: current_user
    }
    
    @answer = Answer.new(answer_params.merge(additional_params))

    if @answer.save
      flash[:success] = "Your answer successfully posted."
      generate_notification(@answer.question)
      redirect_to question_path(params[:question_id])
    else
      flash[:warning] = @answer.errors.messages[:body].first
      redirect_to question_path(params[:question_id])
    end
  end

  def vote
    @answer = Answer.find(params[:id])
    @vote = Vote.create(user: current_user, answer: @answer, value: true)

    generate_notification(@answer.question, @answer) if @vote.valid?

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @answer.destroy
    redirect_to question_path(params[:question_id])
  end

  private

  def requires_answer_owner
    @answer = Answer.find(params[:id])
    unless current_user == @answer.user
      flash[:warning] = "Only can be deleted by answer owner."
      redirect_to question_path(params[:question_id])
    end
  end

  def generate_notification(question, answer=false)
    case answer
    when false
      message = "#{current_user.name} has answered your question. (#{question.body})"
      question.user.notifications.create(message: message, question: question) unless question.user == current_user
    else
      message = "#{current_user.name} has upvoted your answer. (#{question.body})"
      answer.user.notifications.create(message: message, question: question) unless answer.user == current_user
    end
    
  end

  def answer_params
    params.require(:answer).permit(:body)
  end
end