class AnswersController < ApplicationController
  def create
    additional_params = { 
      question_id: params[:question_id],
      user_id: 1
    }

    @answer = Answer.new(answer_params.merge additional_params)
    if @answer.save
      redirect_to question_path(params[:question_id])
    else

    end


  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end