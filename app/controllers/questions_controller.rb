class QuestionsController < ApplicationController
  before_action :requires_sign_in

  def index
    @questions = Question.where(user: current_user)
  end

  def show
    @question = Question.find(params[:id])

    @related_questions = @question.related_questions.reject { |q| q == @question }
  end

  def create
    @question = Question.new
    populate_topics_for_question
    @question.body = params[:question][:body]
    @question.user = current_user

    if @question.save
      flash[:success] = "Question successfully posted."
      redirect_to questions_path
    else
      flash[:warning] = "Something wrong. Question not posted."
      redirect_to questions_path
    end
  end

  def interest
    @topics = current_user.topics

  end

  private

  def populate_topics_for_question
    topics = parse_topics
    topics.each do |topic|
      new_topic = Topic.find_by name: topic
      if new_topic
        @question.topics << new_topic
      else
        @question.topics << Topic.create(name: topic)
      end
    end
  end

  def parse_topics
    topics = params[:question][:topics]
    topics = topics.split(",").map(&:strip)
    topics.map do |topic|
      topic.split(" ").map(&:capitalize).join(" ")
    end
  end
end