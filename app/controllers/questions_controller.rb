class QuestionsController < ApplicationController
  before_action :requires_sign_in
  before_action :set_question, only: [:destroy, :show]

  def index
    if params[:sort] == 'top_views'
      @questions = Question.where(user: current_user).order(views: :desc).paginate(:page => params[:page])
    else
      @questions = Question.where(user: current_user).order(created_at: :desc).paginate(:page => params[:page])
    end
  end

  def show
    @question.update_views
    @related_questions = @question.related_questions.reject { |q| q == @question }
  end

  def create
    @question = Question.new(question_params.merge(user: current_user))
    topics = params[:question][:topics]
    @question.populate_topics!(topics)

    if @question.save
      flash[:success] = "Question successfully posted."
      redirect_to questions_path
    else
      flash[:warning] = @question.errors.messages[:body].first
      redirect_to questions_path
    end
  end

  def destroy 
    @question.destroy
    flash[:success] = "Question deleted."
    redirect_to questions_path
  end

  def interest
    @topics = current_user.topics
  end

  private

  def set_question
    @question = Question.find_by(slug: params[:slug])
  end

  def question_params
    params.require(:question).permit(:body)
  end

end